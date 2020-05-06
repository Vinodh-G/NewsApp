//
//  NewsImageSectionModelTests.swift
//  NewsDetailsTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import NewsDetailUI
@testable import NewsShared
@testable import NewsService

class NewsImageSectionModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSectionType() {
        guard let sectionModel = newsImageSectionModel() else {
            XCTAssertTrue(false, "Should have valid section model")
            return
        }

        XCTAssertEqual(sectionModel.sectionType, NewsDetailsSectionType.newsImage.rawValue)
    }

    func testCellModelCount() {
        guard let sectionModel = newsImageSectionModel() else {
            XCTAssertTrue(false, "Should have valid section model")
            return
        }

        XCTAssertEqual(sectionModel.items.count, 1)
    }

    func testCellModelType() {
        guard let sectionModel = newsImageSectionModel() else {
            XCTAssertTrue(false, "Should have valid section model")
            return
        }

        XCTAssert(sectionModel.items[0] is NewsImageCellModel)
    }
}

extension XCTestCase {
    func newsImageSectionModel() -> NewsImageSectionModel? {
        guard  let newsItem = mockNewsItem() else {
            return nil
        }

        return NewsImageSectionModel(item: newsItem)
    }
}
