//
//  HomeCollectionViewExtension.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return featuredProductsModel?.categories?.count ?? 0
        } else {
            return brandsModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoriesCollectionViewCell", for: indexPath) as! HomeCategoriesCollectionViewCell
            guard let dataAtIndex = featuredProductsModel?.categories?[indexPath.item] else { return cell }
            cell.titleLabel.text = dataAtIndex.name ?? ""

            if indexPath.item == selectedCategoryIndex {
                cell.bgImageView.image = nil
                cell.bgImageView.backgroundColor = UIColor(ColorValues.homeCategoryCollectionCellSelectionColor)
                cell.arrowImageView.isHidden = false
                cell.arrowImageView.setImageTintColor(UIColor(ColorValues.homeCategoryCollectionArrowColor))
            } else {
                cell.bgImageView.kf.setImage(with: URL(string: dataAtIndex.imageSmall ?? ""))
                cell.arrowImageView.isHidden = true
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBrandsCollectionViewCell", for: indexPath) as! HomeBrandsCollectionViewCell
            let dataAtIndex = brandsModel[indexPath.item]
            cell.productNameLabel.text = dataAtIndex.name ?? ""
            cell.productDescreptionLabel.text = dataAtIndex.shortTagline ?? ""
            cell.productImageView.kf.setImage(with: URL(string: dataAtIndex.productImage ?? ""))
            if let redemptionTag = dataAtIndex.redemptionTag {
                cell.redemptionTagLabel.text = redemptionTag
                cell.redemptionTagLabel.textColor = .purple
            } else {
                cell.redemptionTagLabel.text = ""
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            brandsModel = []
            paginationUrl = ""
            selectedCategoryIndex = indexPath.item
            guard let dataAtIndex = featuredProductsModel?.categories?[indexPath.item] else { return }
            handleGetFeaturedProducts(customerId: String(dataAtIndex.id ?? 0), categoryIndex: selectedCategoryIndex)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            return CGSize(width: 144, height: 75)
        } else {
            let width = self.view.frame.width / 2
            return CGSize(width: width - 17, height: 170)
        }
    }
}
