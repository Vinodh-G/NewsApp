//
//  NewsDetailSectionModel.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit
import NewsService

struct NewsDetailsSectionModel: SectionModel {
    var sectionType: String {
        return NewsDetailsSectionType.newsDetails.rawValue
    }

    let newsDetailsText: String
    let sectionID: String

    init(details: String) {
        newsDetailsText = details
        items = [NewsDetailsCellModel(details: details)]
        sectionID = UUID().uuidString
    }

    var header: HeaderViewModel? = nil
    var items: [CellModel]
}

struct NewsDetailsCellModel: CellModel {
    let newsDetailsText: String
    let cellID: String
    init(details: String) {
        newsDetailsText = details
        cellID = UUID().uuidString
    }

    var cellType: String {
        return NewsDetailsCellType.newsImage.rawValue
    }
}
