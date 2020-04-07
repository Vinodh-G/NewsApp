//
//  NewsPage.swift
//  NewsService
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation

public struct NewsPageResponse: Decodable {
    public let status: String
    public let updated: Date
    public let items: [NewsItem]

    public struct NewsItem: Decodable {
        public let sectionName: String
        public let title: String
        public let abstract: String
        public let url: String
        public let publishedDate: Date
        public let multimedia: [NewsMultiMedia]?

        public struct NewsMultiMedia: Decodable {
            public let url: String
            public let size: String
            public let type: String

            enum CodingKeys: String, CodingKey {
                case url = "url"
                case size = "format"
                case type = "type"
            }
        }

        enum CodingKeys: String, CodingKey {
            case sectionName = "section"
            case title = "title"
            case abstract = "abstract"
            case url = "url"
            case publishedDate = "published_date"
            case multimedia = "multimedia"
        }
    }

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case updated = "last_updated"
        case items = "results"
    }
}
