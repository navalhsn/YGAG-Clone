//
//  BaseViewController.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 07/03/22.
//

import UIKit
import NVActivityIndicatorView
import Kingfisher

class BaseViewController: UIViewController {
    //#MARK: Declarations
    var activityIndicator : NVActivityIndicatorView!
    var setCustomHomeNavigation: UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 35))
        let logoImage = UIImageView.init(frame: view.frame)
        logoImage.image  = UIImage(named: "app_logo_navigation")
        logoImage.contentMode = .scaleAspectFit
        view.addSubview(logoImage);
        logoImage.center.x = view.frame.width/2;
        logoImage.center.y = CGFloat(view.frame.height/2);
        return view
    }

    //#MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigation(animated)
    }
    
    //#MARK: Navigation controller
    func setupNavigation(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.titleView = setCustomHomeNavigation
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    func setupActivityIndicator() {
        // configure activity indicator using NVActivityIndicatorView
        let xAxis = (self.view.frame.width / 2) - 27.5
        let yAxis = self.view.center.y
        let frame = CGRect(x: xAxis , y: (yAxis - 50), width: 55, height: 55)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = . ballSpinFadeLoader
        activityIndicator.color = UIColor("#9E3786")
        activityIndicator.padding = 6
        activityIndicator.backgroundColor = UIColor(white: 1, alpha: 0.4)
        activityIndicator.layer.cornerRadius = activityIndicator.frame.height / 2
        self.view.addSubview(activityIndicator)
    }
    
}
