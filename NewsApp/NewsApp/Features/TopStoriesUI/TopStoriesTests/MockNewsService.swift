//
//  MockNewsService.swift
//  VNews
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation
@testable import TopStoriesUI
@testable import NewsService
@testable import NewsShared

class MockNewsService: NewsServiceAPIPrivate {
    let path: String
    init(path: String) {
        self.path = path
    }
    override func newsPage(for request: NewsRequestParam,
                           callback: @escaping (NewsResponseParam) -> Void) {
        do {
            let newsPage: NewsPageResponse = try TestUtil().get(from: path, in: Bundle(for: MockNewsService.self))
            let response = NewsResponseParam(newsPage: newsPage,
                                             error: nil)
            callback(response)
        } catch let error {
            let response = NewsResponseParam(newsPage: nil,
                                             error: NewsServiceError.unKnown(error: error))
            callback(response)
        }
    }
}
