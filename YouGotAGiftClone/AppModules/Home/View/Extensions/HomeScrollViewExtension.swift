//
//  HomeScrollViewExtension.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation
import UIKit

extension HomeViewController: UIScrollViewDelegate {
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//       // categoryContainerHeightConstraint.constant = scrollView.contentInset.top
//        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
//        categoryImageContainerView.clipsToBounds = offsetY <= 0
//        categoryImageBottomConstraint.constant = offsetY >= 0 ? 0 : -offsetY / 2
//        categoryImageTopConstraint.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
//    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // handle view + collection scroll
        if homeScrollView.isAtBottom {
            featuredProductsCollectionView.isScrollEnabled = true
        } else if featuredProductsCollectionView.isAtTop == false {
            featuredProductsCollectionView.isScrollEnabled = true
        } else {
            featuredProductsCollectionView.isScrollEnabled = false
        }
        
        // handle pagination
        if featuredProductsCollectionView.isAtBottom {
            if paginationUrl != Constants.paginationEndText {
                handleGetFeaturedProducts(customerId: nil, categoryIndex: selectedCategoryIndex)
            }
        }
    }
}

