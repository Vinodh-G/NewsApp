//
//  TopStoriesInteractorTests.swift
//  NewsServiceTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI
@testable import NewsService

class TopStoriesInteractorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchTopNews() {
        let interactor = topStoriesInteractor()
        let param = NewsRequestParam(newsPageId: "home")
        interactor.fetchTopNews(requestParam: param) { (items, error) in
            XCTAssertNotNil(items)
        }
    }

    func topStoriesInteractor() -> TopStoriesInteractor {
        let interactor = TopStoriesInteractor(service: MockNewsService(path: "MockedNewsPageResponse.json"))
        return interactor
    }
}
