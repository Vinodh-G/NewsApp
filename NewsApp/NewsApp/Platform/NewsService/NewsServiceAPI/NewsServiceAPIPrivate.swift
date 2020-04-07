//
//  NewsServicePluginPrivate.swift
//  NewsService
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation

public let apiSecret = "DDg70NUMC2esrUKHXabfXAbmnhpD5n5f"
public let apiKey = "api-key"

class NewsServiceAPIPrivate: NewsServiceAPI {

    static let topStoriesPath = "topstories/v2"
    private let service: WebService
    init(service: WebService = WebService()) {
        self.service = service
    }

    func newsPage(for request: NewsRequestParam,
                  callback: @escaping (NewsResponseParam) -> Void) {

        let path = "\(NewsServiceAPIPrivate.topStoriesPath)/\(request.newsPageId).json"
        let request = service.request(requestType: .GET,
                                      requestPath: path)
        request.setQuery(params: [apiKey: apiSecret])
        request.response { (data, response) in
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let newsPageResponse = try decoder.decode(NewsPageResponse.self,
                                                          from: data)
                let responseParam = NewsResponseParam(newsPage: newsPageResponse,
                                                  error: nil)
                callback(responseParam)
            } catch let error {
                let decodeError = NewsServiceError.decodedError(decodedError: error)
                let responseParam = NewsResponseParam(newsPage: nil,
                                                      error: decodeError)
                callback(responseParam)
            }
        }.responseError { (error) in
            let responseParam = NewsResponseParam(newsPage: nil,
                                                  error: error)
            callback(responseParam)
        }
        request.fetch()
    }
}
