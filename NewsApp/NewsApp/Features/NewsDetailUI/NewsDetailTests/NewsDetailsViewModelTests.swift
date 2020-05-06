//
//  NewsDetailsViewModelTests.swift
//  NewsServiceTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import NewsDetailUI
@testable import NewsShared
@testable import NewsService

class NewsDetailsViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCollectionDataSections() {
        let viewModel = newsDetailsViewModel()
        XCTAssertNotNil(viewModel?.collectionViewData)
    }

    func testCollectionDataSectionsCount() {
        let viewModel = newsDetailsViewModel()
        guard let data = viewModel?.collectionViewData else {
            XCTAssertTrue(false, "Should have a valid conllectiondata")
            return
        }

        XCTAssertEqual(data.sections.count, 2)
    }

    func testCollectionDataSectionsNewsImageSectionType() {
        let viewModel = newsDetailsViewModel()
        guard let data = viewModel?.collectionViewData else {
            XCTAssertTrue(false, "Should have a valid conllectiondata")
            return
        }

        XCTAssert(data.sections[0] is NewsImageSectionModel)
    }

    func testCollectionDataSectionsNewsDetailSectionType() {
        let viewModel = newsDetailsViewModel()
        guard let data = viewModel?.collectionViewData else {
            XCTAssertTrue(false, "Should have a valid conllectiondata")
            return
        }

        XCTAssert(data.sections[1] is NewsDetailsSectionModel)
    }

    func newsDetailsViewModel() -> NewsDetailsViewModel? {
        guard let newsItem = mockNewsItem() else { return nil }
        return NewsDetailsViewModel(newsItem: newsItem)
    }
}

extension XCTestCase {

    func mockNewsItem(filePath: String = "MockNewsItem.json") -> NewsPageResponse.NewsItem? {
        do {
            let newsItem: NewsPageResponse.NewsItem = try TestUtil().get(from: filePath,
                                                                            in: Bundle(for: NewsDetailsViewModelTests.self))
            return newsItem
        } catch {
            return nil
        }
    }
}
