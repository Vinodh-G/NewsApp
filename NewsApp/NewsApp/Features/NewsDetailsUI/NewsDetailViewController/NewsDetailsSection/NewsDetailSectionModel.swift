//
//  NewsDetailSectionModel.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import NewsService

struct NewsDetailsSectionModel: SectionModel {
    var sectionType: String {
        return NewsDetailsSectionType.newsDetails.rawValue
    }

    let newsDetailsText: String
    init(details: String) {
        newsDetailsText = details
        items = [NewsDetailsCellModel(details: details)]
    }

    var header: HeaderViewModel? = nil
    var items: [CellModel]
}

struct NewsDetailsCellModel: CellModel {
    let newsDetailsText: String
    init(details: String) {
        newsDetailsText = details
    }

    var cellType: String {
        return NewsDetailsCellType.newsImage.rawValue
    }
}
