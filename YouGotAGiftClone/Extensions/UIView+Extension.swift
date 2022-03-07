//
//  UIView+Extension.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation
import UIKit

extension UIView {
    // This function is used to add shadow to UIView
    // Usage: viewInstance.dropShadow()
    func dropShadow() {
        self.clipsToBounds = false
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.2
    }
    
    // This function is used to add border to UIView
    // Usage: viewInstance.addBorder(cornerRadius: 10, borderColor: .red)
    func addBorder(cornerRadius: Float, borderColor: UIColor) {
        self.clipsToBounds = false
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
    }
}
