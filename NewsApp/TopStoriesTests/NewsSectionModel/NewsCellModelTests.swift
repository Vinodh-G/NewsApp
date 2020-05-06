//
//  NewsCellModelTests.swift
//  TopStoriesTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI
@testable import NewsService
@testable import NewsShared

class NewsCellModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTitle() {
        guard let cellModel = newsItemCellModel() else {
            XCTAssertTrue(false, "News Item Cell Model nil")
            return
        }
        XCTAssertEqual(cellModel.title, "Coronavirus Live Updates: $2 Trillion Aid Bill Becomes Law as U.S. Cases Reach 100,000")
    }

    func testAbstract() {
        guard let cellModel = newsItemCellModel() else {
            XCTAssertTrue(false, "News Item Cell Model nil")
            return
        }
        XCTAssertEqual(cellModel.abstract, "President Trump said the government would buy thousands of ventilators, but it seemed doubtful they could be produced in time to help overwhelmed hospitals.")
    }

    func testImageURLSmall() {
        guard let cellModel = newsItemCellModel() else {
            XCTAssertTrue(false, "News Item Cell Model nil")
            return
        }
        XCTAssertEqual(cellModel.imageURL(size: .small), "https://static01.nyt.com/images/2020/03/03/world/coronavirus-map-promo/coronavirus-map-promo-articleInline-v195.png")
    }

    func testImageURLMedium() {
        guard let cellModel = newsItemCellModel() else {
            XCTAssertTrue(false, "News Item Cell Model nil")
            return
        }
        XCTAssertEqual(cellModel.imageURL(size: .medium), "https://static01.nyt.com/images/2020/03/03/world/coronavirus-map-promo/coronavirus-map-promo-mediumThreeByTwo210-v201.png")
    }

    func testImageURLLarge() {
        guard let cellModel = newsItemCellModel() else {
            XCTAssertTrue(false, "News Item Cell Model nil")
            return
        }
        XCTAssertEqual(cellModel.imageURL(size: .large), "https://static01.nyt.com/images/2020/03/03/world/coronavirus-map-promo/coronavirus-map-promo-superJumbo-v195.png")
    }
}

extension  XCTestCase {

    func newsItemCellModel(cellType: NewsCellType = .fullWidthCard) -> NewsCellModel? {
        guard let item = mockNewsItem() else { return nil }
        return NewsCellModel(cellType: cellType, newsItem: item)
    }

    func mockNewsItem(filePath: String = "MockNewsItem.json") -> NewsPageResponse.NewsItem? {
        do {
            let newsItem: NewsPageResponse.NewsItem = try TestUtil().get(from: filePath,
                                                                        in: Bundle(for: NewsCellModelTests.self))
            return newsItem
        } catch {
            return nil
        }
    }
}

