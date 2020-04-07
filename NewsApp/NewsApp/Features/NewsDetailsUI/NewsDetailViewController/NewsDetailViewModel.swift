//
//  NewsDetailViewModel.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 27/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation
import NewsService
import NewsShared

protocol NewsDetailsViewAPI {
    var collectionViewData: VNCollectionViewData? { get }
}

class NewsDetailsViewModel: NewsDetailsViewAPI {

    let item: NewsPageResponse.NewsItem
    var collectionViewData: VNCollectionViewData?

    init(newsItem: NewsPageResponse.NewsItem) {
        self.item = newsItem
        collectionViewData = collectionViewData(for: newsItem)
    }

    private func collectionViewData(for newsItem: NewsPageResponse.NewsItem) -> VNCollectionViewData {
        var collectionData = VNCollectionViewData()
        collectionData.add(section: NewsImageSectionModel(item: newsItem))
        collectionData.add(section: NewsDetailsSectionModel(details: newsItem.abstract))
        return collectionData
    }
}
