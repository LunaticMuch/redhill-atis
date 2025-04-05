//
//  RedhillAtisUITests.swift
//  RedhillAtisUITests
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import XCTest

final class RedhillAtisUITests: XCTestCase {

    @MainActor
    override func setUpWithError() throws {

        super.setUp()

        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        snapshot("0Launch")
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
