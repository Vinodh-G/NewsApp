//
//  NewsDetailViewModel.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 27/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation
import NewsService
import VSCollectionKit

protocol NewsDetailsViewAPI {
    var collectionViewData: VSCollectionViewData? { get }
}

class NewsDetailsViewModel: NewsDetailsViewAPI {

    let item: NewsPageResponse.NewsItem
    var collectionViewData: VSCollectionViewData?

    init(newsItem: NewsPageResponse.NewsItem) {
        self.item = newsItem
        collectionViewData = collectionViewData(for: newsItem)
    }

    private func collectionViewData(for newsItem: NewsPageResponse.NewsItem) -> VSCollectionViewData {
        var collectionData = VSCollectionViewData()
        collectionData.add(section: NewsImageSectionModel(item: newsItem))
        collectionData.add(section: NewsDetailsSectionModel(details: newsItem.abstract))
        return collectionData
    }
}
