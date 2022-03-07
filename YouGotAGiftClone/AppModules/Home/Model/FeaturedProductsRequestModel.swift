//
//  FeaturedProductsRequestModel.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation

struct FeaturedDataRequest : Encodable {
    let apiKey, apiSecret : String

    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case apiSecret = "api_secret"
    }
}
