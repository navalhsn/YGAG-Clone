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
    func getFeaturedProducts( paginationApi: inout String, categoryId: String?, _ completionHandler: @escaping (FeaturedProductsModel) -> Void) {
        
        var urlPath: String = String()
        // paginationApi will be "" when the api is called for the first time or when category is changed
        if paginationApi == "" {
            // when calling this api for getting catogeries, "&category" is not appended with string
            // when calling this api to get products w.r.t "categoryId", urlPath is appended with "&category"
            if let categoryId = categoryId {
                urlPath = "/?api_key=\(networkManager.apiKey)&api_secret=\(networkManager.apiSecretKey)&category=\(categoryId)"
            } else {
                urlPath = "/?api_key=\(networkManager.apiKey)&api_secret=\(networkManager.apiSecretKey)"
            }
            paginationApi = ApiEndpoints.featuredProductsUrl + urlPath
        }
        guard let url = URL(string: paginationApi) else { return }
        networkManager.getApiData(requestUrl: url, resultType: FeaturedProductsModel.self) { response in
            completionHandler(response)
        }
    }
}
