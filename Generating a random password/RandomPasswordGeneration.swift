//
//  RandomPasswordGeneration.swift
//  Generating a random password
//
//  Created by 123 on 29.11.23.
//

import Foundation
import UIKit



public func generationPassword() -> String {
    var password = ""
    let char = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    for _ in 0..<16 {
        let randomIndex = Int(arc4random_uniform(UInt32(char.count)))
        let randomChar = char[char.index(char.startIndex, offsetBy: randomIndex)]
        password  += String(randomChar)
    }
    return password
}
