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
    var homeViewModel: HomeViewModel = HomeViewModel()
    var featuredProductsModel: FeaturedProductsModel?
    var brandsModel = [Brand](), paginationUrl = ""
    var selectedCategoryIndex: Int = Int()
    
    //#MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
        // pass categoryId as nil when calling this api to get categories
        // categoryIndex is passed as 0 index data is being shown at first luanch
        handleGetFeaturedProducts(categoryId: nil, categoryIndex: 0)
    }
    
    //#MARK: API Functions
    func handleGetFeaturedProducts(categoryId: String?, categoryIndex: Int) {
        self.startLoader()
        homeViewModel.getFeaturedProducts(paginationApi: &paginationUrl, categoryId: categoryId, { response in
            self.featuredProductsModel = response
            if let paginationUrl = response.paginatedData?.next {
                self.paginationUrl = paginationUrl
            } else {
                self.paginationUrl = Constants.paginationEndText
            }
            
            self.setupBrands(brandsResponse: response.brands ?? [])
            
            DispatchQueue.main.async {
                self.categoryImageView.kf.setImage(with: URL(string: response.categories?[categoryIndex].imageLarge ?? ""))
                self.categoryTitleLabel.text = response.categories?[categoryIndex].name ?? ""
                self.categoryLargeTitleLabel.text = response.categories?[categoryIndex].title ?? ""
                self.categoriesCollectionView.reloadData()
                self.stopLoader()
            }
        })
    }
    
    //#MARK: Other Functions
    func setupBrands(brandsResponse: [Brand]) {
        for i in brandsResponse {
            self.brandsModel.append(i)
        }
        DispatchQueue.main.async {
            self.featuredProductsCollectionView.reloadData()
        }
    }
    
    func setupUIElements() {
        // configure scrollview in a way that it should only scroll till category collection reach at top
        let screenType = UIDevice().screenType
        // for devices that having notch, view height is greater than devices without notch
        if screenType == .iPhones_6_6s_7_8 || screenType == .iPhones_5_5s_5c_SE || screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
            containerViewHeight.constant = self.view.bounds.size.height + 140
        } else {
            containerViewHeight.constant = self.view.frame.size.height + 80
        }
        // featuredProductsCollectionView should be scrollable only after homeScrollview reach at top
        featuredProductsCollectionView.isScrollEnabled = false
    }
    
}
