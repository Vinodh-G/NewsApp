//
// NewsServiceAPIPrivateTests.swift
//  NewsServiceTests
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import NewsService

class NewsServiceAPIPrivateTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChatMessagesDecodingMessageResponse() {
        let param = NewsRequestParam(newsPageId: "home")
        let newsServiceApi = NewsServiceAPIPrivate(service: MockWebServiceValidResponse())

        newsServiceApi.newsPage(for: param) { (responseParam) in
            guard let newsItems = responseParam.newsPage?.items else {
                XCTAssert(false, "Unable to Decode the mock newsResponse")
                return
            }
            XCTAssertEqual(newsItems.count, 25)
        }
    }

    // TODO: Yet to handle other error cases 
}
