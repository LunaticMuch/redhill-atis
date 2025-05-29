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
    }

    @MainActor
    func testExample() throws {
        snapshot("0Launch")
        let app = XCUIApplication()
        app.launch()
    }

}
