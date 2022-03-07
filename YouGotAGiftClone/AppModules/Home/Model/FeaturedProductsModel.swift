//
//  FeaturedProductsModel.swift
//  YouGotAGiftClone
//
//  Created by Naval Hasan on 06/03/22.
//

import Foundation

//MARK: FeaturedProductsModel
struct FeaturedProductsModel: Codable {
    let label: String?
    let paginatedData: PaginatedData?
    let brands: [Brand]?
    let categories: [Category]?
    let selectedCategory: SelectedCategory?
    let tagsCount: Int?

    enum CodingKeys: String, CodingKey {
        case label
        case paginatedData = "paginated_data"
        case brands, categories
        case selectedCategory = "selected_category"
        case tagsCount = "tags_count"
    }
}

//MARK: Brand
struct Brand: Codable {
    let id: Int?
    let name: String?
    let logo: String?
    let productImage: String?
    let shortTagline, brandCode: String?
    let isGeneric: Bool?
    let seoName: String?
    let currency: String?
    let detailURL: String?
    let redemptionTag: String?
    let detailURLV5: String?

    enum CodingKeys: String, CodingKey {
        case id, name, logo
        case productImage = "product_image"
        case shortTagline = "short_tagline"
        case brandCode = "brand_code"
        case isGeneric = "is_generic"
        case seoName = "seo_name"
        case currency
        case detailURL = "detail_url"
        case redemptionTag = "redemption_tag"
        case detailURLV5 = "detail_url_v5"
    }
}

//MARK: Category
struct Category: Codable {
    let id: Int?
    let name, seoName: String?
    let imageLarge, imageSmall: String?
    let title: String?
    let caption: String?
    let defaultDisplay: Bool?
    let bgColorCode, tagType: String?
    let iconImage: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case seoName = "seo_name"
        case imageLarge = "image_large"
        case imageSmall = "image_small"
        case title, caption
        case defaultDisplay = "default_display"
        case bgColorCode = "bg_color_code"
        case tagType = "tag_type"
        case iconImage = "icon_image"
    }
}

//MARK: PaginatedData
struct PaginatedData: Codable {
    let count: Int?
    let previous: String?
    let next: String?
}

//MARK: SelectedCategory
struct SelectedCategory: Codable {
    let id: Int?
    let bgColorCode: String?
    let imageSmall: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case bgColorCode = "bg_color_code"
        case imageSmall = "image_small"
        case name
    }
}
