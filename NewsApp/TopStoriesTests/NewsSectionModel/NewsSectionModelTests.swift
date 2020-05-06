//
//  NewsSectionModelTests.swift
//  TopStoriesTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI
@testable import NewsService
@testable import NewsShared

class NewsSectionModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSectionModelType() {
        guard let sectionModel = newsSectionModel(catType: "world") else {
            XCTAssertTrue(false, "Should have a valid SectionModel")
            return
        }

        XCTAssertEqual(sectionModel.sectionType, NewsSectionType.news.rawValue)
    }

    func testNewsCatSectionModelCellModelCount() {
        guard let sectionModel = newsSectionModel(catType: "world") else {
            XCTAssertTrue(false, "Should have a valid SectionModel")
            return
        }
        XCTAssertEqual(sectionModel.items.count, 25)
    }

    func testNewsCatSectionModelCellModelType() {
        guard let sectionModel = newsSectionModel(catType: "world") else {
            XCTAssertTrue(false, "Should have a valid SectionModel")
            return
        }
        XCTAssertEqual(sectionModel.items[0].cellType, NewsCellType.fullWidthCard.rawValue)
    }

    func testNewsCatSectionModelHeader() {
        guard let sectionModel = newsSectionModel(catType: "world") else {
            XCTAssertTrue(false, "Should have a valid SectionModel")
            return
        }

        XCTAssertNotNil(sectionModel.header)
    }

    func testOtherCatSectionModelCellModelCount() {
        guard let sectionModel = newsSectionModel(catType: "others") else {
            XCTAssertTrue(false, "Should have a valid SectionModel")
            return
        }
        XCTAssertEqual(sectionModel.items.count, 25)
    }

    func testOtherNewsCatSectionModelCellModelType() {
        guard let sectionModel = newsSectionModel(catType: "others") else {
            XCTAssertTrue(false, "Should have a valid SectionModel")
            return
        }
        XCTAssertEqual(sectionModel.items[0].cellType, NewsCellType.groupedList.rawValue)
    }

    func testOtherNewsCatSectionModelHeader() {
        guard let sectionModel = newsSectionModel(catType: "others") else {
            XCTAssertTrue(false, "Should have a valid SectionModel")
            return
        }

        XCTAssertNotNil(sectionModel.header)
    }
}

extension XCTestCase {

    func newsSectionModel(catType: String) -> NewsSectionModel? {
        guard let items = newsPageResponse()?.items else { return nil }
        let sectionModel = NewsSectionModel(categoryType: catType,
                                            categoryName: "World",
                                            newsItems: items)
        return sectionModel
    }

    func newsPageResponse() -> NewsPageResponse? {
        do {
            let newsPage: NewsPageResponse = try TestUtil().get(from: "MockedNewsPageResponse.json", in: Bundle(for: NewsSectionModelTests.self))
            return newsPage
        } catch {
            return nil
        }
    }
}
