//
//  HomeBrandsCollectionViewCell.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import UIKit

class HomeBrandsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var redemptionTagLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescreptionLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // addBorder is a UIView extension used for adding border to view
        self.addBorder(cornerRadius: 10, borderColor: .gray)
    }
}
