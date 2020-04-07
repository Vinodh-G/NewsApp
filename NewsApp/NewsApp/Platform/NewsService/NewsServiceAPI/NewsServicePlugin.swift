//
//  NewsServicePlugin.swift
//  NewsService
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation

public struct NewsRequestParam {
    public let newsPageId: String
    public let pageToken: String?
    public init(newsPageId: String, pageToken: String? = nil) {
        self.newsPageId = newsPageId
        self.pageToken = pageToken
    }
}

public struct NewsResponseParam {
    public let newsPage: NewsPageResponse?
    public let error: NewsServiceError?
}

public protocol NewsServiceAPI {
    func newsPage(for request: NewsRequestParam,
                  callback: @escaping (_ messagesResponse: NewsResponseParam) -> Void)
}

public class NewsServicePlugin {
    public static func newsServicePlugin() -> NewsServiceAPI {
        return NewsServiceAPIPrivate()
    }
}
