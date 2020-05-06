//
//  NewsDetailAPIPrivateTests.swift
//  NewsDetailsTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import Plugin
@testable import NewsDetailUI


class NewsDetailAPIPrivateTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewsDetailsViewControllerClass() {
        let pluginPrivate = NewsDetailAPIPrivate()
        guard let newsData = mockNewsItem() else { return }
        let param = NewsDetailsPageParam(pageId: "23123321", data: newsData)
        let newsDetailsViewController = pluginPrivate.newsDetailsViewController(param: param)

        XCTAssert(newsDetailsViewController is NewsDetailViewController)
    }
}
