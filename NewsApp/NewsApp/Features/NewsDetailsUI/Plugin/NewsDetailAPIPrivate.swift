//
//  NewsDetailAPIPrivate.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit
import Plugin
import NewsService

class NewsDetailAPIPrivate: NewsDetailsUIAPI {
    
    func newsDetailsViewController(param: NewsDetailsPageParam) -> UIViewController? {
        guard let newsItem = param.data as? NewsPageResponse.NewsItem else { return nil }
        let viewModel = NewsDetailsViewModel(newsItem: newsItem)
        let newsDetailsView = NewsDetailViewController()
        newsDetailsView.viewModel = viewModel
        return newsDetailsView
    }
}
