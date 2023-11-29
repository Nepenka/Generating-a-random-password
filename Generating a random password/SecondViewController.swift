//
//  SecondViewController.swift
//  Generating a random password
//
//  Created by 123 on 29.11.23.
//

import UIKit
import SnapKit
import CoreData



class SecondViewController: UIViewController {
    
    let label: UILabel = .init()
    let button: UIButton = .init()
    let historyButton: UIButton = .init()
    var passwordGeneration: String = ""
    var manageObjectContext: NSManagedObjectContext!
    let insets = UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 10)
    let buttonSize = CGSize(width: 200, height: 50)
    let coreDataStack = CoreDataStack.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationController = UINavigationController(rootViewController: self)
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        view.backgroundColor = UIColor(red: 241/255, green: 238/255, blue: 228/255, alpha: 1)
        navigationItem.hidesBackButton = true
        passwordGeneration = generationPassword()
        label.text = passwordGeneration
        setupUI()
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            manageObjectContext = appDelegate.persistentContainer.viewContext
        }
    }
    
    func setupUI() {
        settingLabel(label)
        label.shadowColor = .systemBlue
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.textAlignment = .center
        
        view.addSubview(label)
        label.snp.makeConstraints { label in
            label.centerX.equalToSuperview()
            label.centerY.equalToSuperview()
            label.left.right.equalToSuperview()
        }
        
        settingButton(button)
        button.setTitle("NEXT PASSWORD", for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { button in
            button.top.equalTo(label).offset(80)
            button.left.right.equalToSuperview().inset(50)
            button.height.equalTo(40)
        }
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.addSubview(historyButton)
        historyButton.setImage(UIImage(systemName: "book.fill"), for: .normal)
        historyButton.contentEdgeInsets = insets
        historyButton.frame.size = buttonSize
        historyButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        historyButton.addTarget(self, action: #selector(historyButtonAction), for: .touchUpInside)
    }
    
    
    func savePasswordToCoreData(password: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "PasswordHistory", in: coreDataStack.context) else {
            print("Error: Entity 'PasswordHistory' not found.")
            return
        }
        
        let newPassword = NSManagedObject(entity: entity, insertInto: coreDataStack.context)
        newPassword.setValue(password, forKey: "password")
        
        do {
            try coreDataStack.saveContext()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    
    @objc func buttonAction() {
        passwordGeneration = generationPassword()
        label.text = passwordGeneration
        savePasswordToCoreData(password: passwordGeneration)
        
        if let presentingViewController = presentingViewController as? HistoryViewController {
            presentingViewController.generatedPasswords.append(passwordGeneration)
            presentingViewController.tableView.reloadData()
        }
    }
    
    @objc func historyButtonAction() {
        let history = HistoryViewController()
        navigationController?.pushViewController(history, animated: true)
    }
}
