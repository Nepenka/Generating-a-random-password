//
//  HistoryViewController.swift
//  Generating a random password
//
//  Created by 123 on 29.11.23.
//

import UIKit
import SnapKit
import CoreData

class HistoryViewController: UIViewController {
    
    let tableView: UITableView = .init()
    var generatedPasswords: [String] = []
    let coreDataStack = CoreDataStack.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 241/255, green: 238/255, blue: 228/255, alpha: 1)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        fetchPasswordsFromCoreData()
    }
    
    func fetchPasswordsFromCoreData() {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PasswordHistory")
            do {
                if let results = try coreDataStack.context.fetch(fetchRequest) as? [NSManagedObject] {
                    // Извлекаем пароли и добавляем их в массив
                    for result in results {
                        if let password = result.value(forKey: "password") as? String {
                            generatedPasswords.append(password)
                        }
                    }
                }
            } catch {
                print("Error fetching passwords: \(error)")
            }
        }
    }
    

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generatedPasswords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = generatedPasswords[indexPath.row]
        
        return cell
    }
}

class TableViewCell: UITableViewCell {
    
}
