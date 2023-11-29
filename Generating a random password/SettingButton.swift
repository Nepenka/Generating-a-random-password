//
//  SettingButton.swift
//  Generating a random password
//
//  Created by 123 on 29.11.23.
//

import Foundation
import UIKit



public func settingButton(_ button: UIButton) {
    button.backgroundColor = .systemBlue
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 2
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 10
    button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
    
}
