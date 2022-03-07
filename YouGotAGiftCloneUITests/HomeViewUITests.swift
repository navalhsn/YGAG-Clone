//
//  HomeViewUITests.swift
//  YouGotAGiftCloneUITests
//
//  Created by Naval Hasan on 07/03/22.
//

import XCTest

class HomeViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_categoryTitle_shouldMatch_MainTitle() throws {
        let app = XCUIApplication()
        app.launch()
        
        let firstChild = app.collectionViews.children(matching:.any).element(boundBy: 0)
        if firstChild.exists {
            let categoryTitle = firstChild.staticTexts["categoryLabelId"]
            let mainTitle = app.scrollViews.children(matching: .other).element.children(matching: .other).element(boundBy: 1).staticTexts["mainTitleId"]
            XCTAssertEqual(categoryTitle, mainTitle)
        }
    }
    
    func test_howItWorks_ButtonTitle_ShouldMatch_theText() throws {
        let app = XCUIApplication()
        app.launch()
        app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["How it works"]/*[[".buttons[\"How it works\"].staticTexts[\"How it works\"]",".staticTexts[\"How it works\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

}
