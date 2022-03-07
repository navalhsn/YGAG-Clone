//
//  UIImageView+Extension.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation
import UIKit

extension UIImageView {
    // can be used to set tint color for imageviews
    // Usage: myImageView.setImageTintColor(.systemBlue)
    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = tintedImage
        self.tintColor = color
    }
}
