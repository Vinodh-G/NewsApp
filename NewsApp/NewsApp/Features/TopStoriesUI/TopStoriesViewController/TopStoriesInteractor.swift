//
//  TopStoriesInteractor.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsService

class TopStoriesInteractor {
    let service: NewsServiceAPI
    init(service: NewsServiceAPI = NewsServicePlugin.newsServicePlugin()) {
        self.service = service
    }

    func fetchTopNews(requestParam: NewsRequestParam,
                      callback: @escaping (_ newsResponse: [NewsPageResponse.NewsItem]?, _ error: Error?) -> Void ) {
        service.newsPage(for: requestParam) { (response) in
            guard let newsItems = response.newsPage?.items else {
                callback(nil, response.error)
                return
            }

            // TODO: write the news to database service, so next time, when user launches the app,
            // uses the news from DB and fetch the latest from service
            callback(newsItems, nil)
        }
    }
}
