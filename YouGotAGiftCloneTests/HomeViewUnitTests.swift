//
//  HomeViewUnitTests.swift
//  YouGotAGiftCloneTests
//
//  Created by Naval Hasan on 07/03/22.
//

import XCTest
@testable import YouGotAGiftClone

class HomeViewUnitTests: XCTestCase {
    // sut : system under test
    let sut: HomeViewModel = HomeViewModel()
    
    func test_getFeaturedProducts_as_pagination_emptystring() {
        var paginationString = ""
        sut.getFeaturedProducts(paginationApi: &paginationString, customerId: nil, {
            response in
            // confirming necessary data are not nil
            XCTAssertNotNil(response)
            XCTAssertNotNil(response.paginatedData)
            XCTAssertNotNil(response.brands)
            
            // when pagination string is "", next should be nil
            XCTAssertEqual(response.paginatedData?.next, nil)
        })
    }
    
    func test_getFeaturedProducts_as_customerId_not_nil() {
        var paginationString = ""
        sut.getFeaturedProducts(paginationApi: &paginationString, customerId: "32", {
            response in
            // confirming necessary data are not nil
            XCTAssertNotNil(response)
            XCTAssertNotNil(response.paginatedData)
            // categories should not be nil
            XCTAssertNotNil(response.categories)
        })
    }

}
