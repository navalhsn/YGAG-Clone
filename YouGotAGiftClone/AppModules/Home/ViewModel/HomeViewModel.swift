//
//  HomeViewModel.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation

struct HomeViewModel {
    // Declarations
    let networkManager = NetworkManager()
    
    // API calls
    func getFeaturedProducts(customerId: String?, _ completionHandler: @escaping (FeaturedProductsModel) -> Void) {
        
        var urlPath: String = String()
        // when calling this api for getting catogeries, "&category" is not appended with string
        // when calling this api to get products w.r.t "customerId", urlPath is appended with "&category"
        if let customerId = customerId {
            urlPath = "/?api_key=\(networkManager.apiKey)&api_secret=\(networkManager.apiSecretKey)&category=\(customerId)"
        } else {
            urlPath = "/?api_key=\(networkManager.apiKey)&api_secret=\(networkManager.apiSecretKey)"
        }
        guard let featuredProductsUrl = URL(string: ApiEndpoints.featuredProductsUrl + urlPath) else { return }
        networkManager.getApiData(requestUrl: featuredProductsUrl, resultType: FeaturedProductsModel.self) { response in
            completionHandler(response)
        }
    }
}
