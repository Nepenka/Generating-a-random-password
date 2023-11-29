//
//  ViewController.swift
//  Generating a random password
//
//  Created by 123 on 29.11.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    let button = UIButton()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationController = UINavigationController(rootViewController: self)
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        view.backgroundColor = UIColor(red: 241/255, green: 238/255, blue: 228/255, alpha: 1)
        if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
                setupUI()
                    UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                } else {
                    let secondViewController = SecondViewController()
                    navigationController.pushViewController(secondViewController, animated: true)
                }
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateButton(button, view)
    }
    
    func setupUI() {
        settingLabel(label)
        label.text = "Hello, this is my application for generating random password. Enjoy using it!"
        label.clipsToBounds = true
        label.numberOfLines = 0
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview().inset(60)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        settingButton(button)
        button.setTitle("GET START", for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(45)
            make.trailing.equalToSuperview().inset(45)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(65)
            make.height.equalTo(50)
        }
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
    }
    @objc func buttonAction() {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)

    }
}

