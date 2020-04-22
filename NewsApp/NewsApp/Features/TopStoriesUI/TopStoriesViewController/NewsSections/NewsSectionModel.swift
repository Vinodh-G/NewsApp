//
//  StoriesSectionModel.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit
import NewsService

struct NewsSectionModel: SectionModel {

    var sectionType: String {
        return NewsSectionType.news.rawValue
    }

    var header: HeaderViewModel?
    var items: [CellModel] = []
    let categoryName: String
    let categoryType: String
    let sectionID: String
    init(categoryType: String,
         categoryName: String,
         newsItems: [NewsPageResponse.NewsItem]) {
        self.categoryName = categoryName
        self.categoryType = categoryType
        header = NewsHeaderModel(title: categoryName)
        sectionID = UUID().uuidString
        if let cellType = NewsCellType(rawValue: NewsLayoutHandler.layoutType(for: categoryType).rawValue) {
            newsItems.forEach { (newsItem) in
                items.append(NewsCellModel(cellType: cellType,
                                           newsItem: newsItem))
            }
        }
    }
}
