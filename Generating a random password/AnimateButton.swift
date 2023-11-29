//
//  AnimateButton.swift
//  Generating a random password
//
//  Created by 123 on 29.11.23.
//

import Foundation
import UIKit
import SnapKit


public func animateButton(_ button: UIButton, _ view: UIView) {
    
    let initialX = view.frame.width + button.frame.width / 2
    button.center = CGPoint(x: initialX, y: view.center.y)
    
    UIView.animate(
        withDuration: 2.5,
        delay: 0.0,
        usingSpringWithDamping: 0.4,
        initialSpringVelocity: 0.4,
        options: .allowAnimatedContent,
        animations: {
           
            let finalY = view.frame.height - button.frame.height / 2 - 20
            button.center = CGPoint(x: view.center.x, y: finalY)
            button.transform = CGAffineTransform(rotationAngle: 0)
        },
        completion: nil
    )
}
