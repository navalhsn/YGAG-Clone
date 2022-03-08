//
//  HomeScrollViewExtension.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation
import UIKit

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // handle view + collection scroll
        if homeScrollView.isAtBottom {
            featuredProductsCollectionView.isScrollEnabled = true
        } else {
            featuredProductsCollectionView.isScrollEnabled = false
        }
        
        // handle pagination
        if featuredProductsCollectionView.isAtBottom {
            if paginationUrl != Constants.paginationEndText {
                handleGetFeaturedProducts(categoryId: nil, categoryIndex: selectedCategoryIndex)
            }
        }
    }
}

