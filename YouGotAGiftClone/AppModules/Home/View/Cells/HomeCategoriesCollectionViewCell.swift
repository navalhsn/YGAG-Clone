//
//  HomeCategoriesCollectionViewCell.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import UIKit

class HomeCategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var arrowImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        makeRoundedCorners()
    }
    
    func makeRoundedCorners() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
