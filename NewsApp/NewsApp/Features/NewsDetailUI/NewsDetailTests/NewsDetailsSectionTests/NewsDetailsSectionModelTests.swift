//
//  NewsDetailsSectionModelTests.swift
//  NewsDetailsTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import NewsDetailUI
@testable import NewsShared
@testable import NewsService

class NewsDetailsSectionModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSectionType() {
        let sectionModel = newsDetailsSectionModel()
        XCTAssertEqual(sectionModel.sectionType, NewsDetailsSectionType.newsDetails.rawValue)
    }

    func testCellModelCount() {
        let sectionModel = newsDetailsSectionModel()
        XCTAssertEqual(sectionModel.items.count, 1)
    }

    func testCellModelType() {
        let sectionModel = newsDetailsSectionModel()
        XCTAssert(sectionModel.items[0] is NewsDetailsCellModel)
    }

    func newsDetailsSectionModel() -> NewsDetailsSectionModel {
        return NewsDetailsSectionModel(details: "President Trump said the government would buy thousands of ventilators, but it seemed doubtful they could be produced in time to help overwhelmed hospitals.")
    }
}
