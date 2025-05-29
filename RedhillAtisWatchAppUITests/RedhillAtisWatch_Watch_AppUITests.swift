//
//  RedhillAtisWatch_Watch_AppUITests.swift
//  RedhillAtisWatch Watch AppUITests
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import XCTest

final class RedhillAtisWatch_Watch_AppUITests: XCTestCase {

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
