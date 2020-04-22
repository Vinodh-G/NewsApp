//
//  NewsCellModel.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import NewsService
import VSCollectionKit

protocol NewsCellViewAPI {
    var title: String { get }
    var abstract: String { get }
    var timeStamp: String { get }
    var newsData: Any { get }
    func imageURL(size: NewsImageSize) -> String?
}

struct NewsCellModel: CellModel, NewsCellViewAPI {
    let cellID: String
    var cellType: String
    private let newsItem: NewsPageResponse.NewsItem
    private let imageURLCache: [String: String]
    
    init(cellType: NewsCellType,
         newsItem: NewsPageResponse.NewsItem) {
        self.newsItem = newsItem
        self.cellType = cellType.rawValue
        self.imageURLCache = NewsCellModel.newsImageURLCache(multimedia: newsItem.multimedia)
        cellID = UUID().uuidString
    }

    var title: String {
        return newsItem.title
    }

    var abstract: String {
        return newsItem.abstract
    }

    var timeStamp: String {
        return newsItem.publishedDate.elapsedTimeString()
    }

    var newsData: Any {
        return newsItem
    }

    func imageURL(size: NewsImageSize) -> String? {
        return imageURLCache[size.rawValue]
    }

    private static func newsImageURLCache(multimedia: [NewsPageResponse.NewsItem.NewsMultiMedia]?) -> [String: String] {
        var cache: [String: String] = [:]
        multimedia?.forEach{ (media) in
            cache[media.size] = media.url
        }

        return cache
    }
}
