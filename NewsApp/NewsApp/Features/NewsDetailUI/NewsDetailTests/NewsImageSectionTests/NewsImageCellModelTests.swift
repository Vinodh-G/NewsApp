//
//  NewsImageCellModelTests.swift
//  NewsDetailsTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import NewsDetailUI
@testable import NewsShared
@testable import NewsService

class NewsImageCellModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellModelType() {
        guard let cellModel = newsImageCellModel() else {
            XCTAssertTrue(false, "Should have valid Cell Model")
            return
        }

        XCTAssertEqual(cellModel.cellType, NewsDetailsCellType.newsImage.rawValue)
    }

    func testTitle() {
        guard let cellModel = newsImageCellModel() else {
            XCTAssertTrue(false, "Should have valid Cell Model")
            return
        }

        XCTAssertEqual(cellModel.title, "Coronavirus Live Updates: $2 Trillion Aid Bill Becomes Law as U.S. Cases Reach 100,000")
    }

    func testTimestamp() {
        guard let cellModel = newsImageCellModel() else {
            XCTAssertTrue(false, "Should have valid Cell Model")
            return
        }

        XCTAssertNotNil(cellModel.timestamp)
    }

    func testImageUrl() {
        guard let cellModel = newsImageCellModel() else {
            XCTAssertTrue(false, "Should have valid Cell Model")
            return
        }

        XCTAssertEqual(cellModel.imageUrl, "https://static01.nyt.com/images/2020/03/03/world/coronavirus-map-promo/coronavirus-map-promo-superJumbo-v195.png")
    }

    func testCachedImageUrl() {
        guard let cellModel = newsImageCellModel() else {
            XCTAssertTrue(false, "Should have valid Cell Model")
            return
        }

        XCTAssertEqual(cellModel.cachedImageUrl, "https://static01.nyt.com/images/2020/03/03/world/coronavirus-map-promo/coronavirus-map-promo-mediumThreeByTwo210-v201.png")
    }
}

extension XCTestCase {
    func newsImageCellModel() -> NewsImageCellModel? {
        guard  let newsItem = mockNewsItem() else { return nil}
        return NewsImageCellModel(item: newsItem)
    }
}
