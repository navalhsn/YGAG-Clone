//
//  HomeViewConroller.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    //#MARK: Outlets
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var featuredProductsCollectionView: UICollectionView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryLargeTitleLabel: UILabel!
    @IBOutlet weak var categoryImageContainerView: UIView!
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var howItWorksButton: UIButton! {
        didSet{
            howItWorksButton.backgroundColor = .clear
            howItWorksButton.layer.cornerRadius = 4
            howItWorksButton.layer.borderWidth = 1
            howItWorksButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    //#MARK: Declarations
    private var homeViewModel: HomeViewModel = HomeViewModel()
    var featuredProductsModel: FeaturedProductsModel?
    var selectedCategoryIndex: Int = Int()
    
    //#MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
        
        // pass customerId as nil when calling this api to get categories
        // categoryIndex is passed as 0 index data is being shown at first luanch
        handleGetFeaturedProducts(customerId: nil, categoryIndex: 0)
    }
    
    //#MARK: API Functions
    func handleGetFeaturedProducts(customerId: String?, categoryIndex: Int) {
        activityIndicator.startAnimating()
        homeViewModel.getFeaturedProducts(customerId: customerId, { response in
            self.featuredProductsModel = response
            DispatchQueue.main.async {
                self.categoryImageView.kf.setImage(with: URL(string: response.categories?[categoryIndex].imageLarge ?? ""))
                self.categoryTitleLabel.text = response.categories?[categoryIndex].name ?? ""
                self.categoryLargeTitleLabel.text = response.categories?[categoryIndex].title ?? ""
                self.featuredProductsCollectionView.reloadData()
                self.categoriesCollectionView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        })
    }
    
    func setupUIElements() {
        // configure scrollview in a way that it should only scroll till category collection reach at top
        containerViewHeight.constant = self.view.frame.size.height + 140
        // featuredProductsCollectionView should be scrollable only after homeScrollview reach at top
        featuredProductsCollectionView.isScrollEnabled = false
    }
    
}
