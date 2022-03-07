//
//  NetworkManager.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation

struct NetworkManager {
    let apiKey = "2vq1M9ye4eV6H1Mr"
    let apiSecretKey = "wnRY14QoA99B4Ae6wn2CU2y8"
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void) {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.addValue("4.3.1", forHTTPHeaderField: "app-version")
        urlRequest.addValue("ios", forHTTPHeaderField: "app-platform")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(data != nil && data?.count != 0) {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
}
