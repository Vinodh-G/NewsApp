//
//  ErrorCellModelTests.swift
//  TopStoriesTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI

class ErrorCellModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellModelType() {
        let cellModel = ErrorCellModel(errorMessage: "Error Message", actionTitle: "Retry")
        XCTAssertEqual(cellModel.cellType, NewsCellType.error.rawValue)
    }

    func testMessage() {
        let cellModel = ErrorCellModel(errorMessage: "Error Message", actionTitle: "Retry")
        XCTAssertEqual(cellModel.errorMessage, "Error Message")
    }

    func testActionTitle() {
         let cellModel = ErrorCellModel(errorMessage: "Error Message", actionTitle: "Retry")
        XCTAssertEqual(cellModel.actionTitle, "Retry")
    }

}
