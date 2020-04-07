//
//  TopStoriesViewModel.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import AppConfigService
import NewsService
import UIKit
import VSCollectionKit

protocol TopStoriesViewAPI {
    var title: String { get }
    var collectionViewData: VSCollectionViewData? { get }
    var viewUpdateHandler: ((_ collectionViewData: VSCollectionViewData?, _ errorMessage: String?) -> Void)? { get set }
    func fetchTopStories()
}

protocol TopStoriesViewRetryAction {
    func retry()
}

class TopStoriesViewModel: TopStoriesViewAPI {

    let interactor: TopStoriesInteractor
    let uiConfig: TopStoriesUIConfig
    let newsPageName: String
    var title: String {
        return "The New York Times"
    }

    var collectionViewData: VSCollectionViewData?
    var viewUpdateHandler: ((VSCollectionViewData?, String?) -> Void)?

    init(newsPageName: String,
         interator: TopStoriesInteractor = TopStoriesInteractor(),
         uiConfig: TopStoriesUIConfig = AppConfigService.topStoriesUIConfig()) {
        self.newsPageName = newsPageName
        self.interactor = interator
        self.uiConfig = uiConfig
    }
    
    func fetchTopStories() {

        collectionViewData = collectionDataforInitialLoading()
        viewUpdateHandler?(collectionViewData, nil)

        let param = NewsRequestParam(newsPageId: newsPageName)
        interactor.fetchTopNews(requestParam: param) { [weak self] (newsItems, error) in
            guard let self = self else { return }
            guard let items = newsItems else {
                self.collectionViewData = self.collectionData(for: error)
                self.viewUpdateHandler?(self.collectionViewData, nil)
                return
            }

            self.collectionViewData = self.collectionData(for: items)
            self.viewUpdateHandler?(self.collectionViewData, nil)
        }
    }

    private func collectionData(for newItems: [NewsPageResponse.NewsItem]) -> VSCollectionViewData? {

        guard var currentData = collectionViewData else { return nil }
        currentData.resetUpdate()

        if let loadingSection = currentData.sectionModel(for: NewsSectionType.loading.rawValue) as? LoadingSectionModel {
            currentData.delete(section: loadingSection)
        }

        let sections = newsSections(for: newItems)
        sections.forEach { (section) in
            currentData.add(section: section)
        }

        return currentData
    }

    private func collectionData(for error: Error?) -> VSCollectionViewData? {
        guard var currentData = collectionViewData else { return nil }
        currentData.resetUpdate()

        if let loadingSection = currentData.sectionModel(for: NewsSectionType.loading.rawValue) as? LoadingSectionModel {
            currentData.delete(section: loadingSection)
        }

        let (errorMessage, action) = TopStoriesErrorMessage.errorMessage(for: error)
        currentData.add(section: ErrorSectionModel(errorMessage: errorMessage, actionTitle: action))
        return currentData
    }

    private func newsSections(for items: [NewsPageResponse.NewsItem]) -> [NewsSectionModel] {

        var newsCache: [String: [NewsPageResponse.NewsItem]] = newsItemsSeperatedBySections(items: items)

        var sections: [NewsSectionModel] = []
        for section in uiConfig.newsCategories {
            if let newsItems = newsCache[section.type],
                newsItems.count > 2 {
                let newsSection = NewsSectionModel(categoryType: section.type,
                                                   categoryName: section.name,
                                                   newsItems: newsItems)
                sections.append(newsSection)
                newsCache[newsSection.categoryName] = nil
            }
        }


        var otherCatNewsItems: [NewsPageResponse.NewsItem] = []
        newsCache.forEach { (sectionName, items) in
            otherCatNewsItems.append(contentsOf: items)
        }

        let otherNewsCatSection = NewsSectionModel(categoryType: "others",
                                                   categoryName: "Others",
                                                   newsItems: otherCatNewsItems)
        sections.append(otherNewsCatSection)
        return sections
    }

    private func newsItemsSeperatedBySections(items: [NewsPageResponse.NewsItem]) -> [String: [NewsPageResponse.NewsItem]] {
        var newsCache: [String: [NewsPageResponse.NewsItem]] = [:]

        items.forEach { (item) in
            if var newsItems = newsCache[item.sectionName] {
                newsItems.append(item)
                newsCache[item.sectionName] = newsItems
            } else {
                newsCache[item.sectionName] = [item]
            }
        }

        return newsCache
    }

    private func collectionDataforInitialLoading() -> VSCollectionViewData {

        var collectionData = VSCollectionViewData()
        let section = LoadingSectionModel()
        collectionData.add(section: section)
        return collectionData
    }
}

extension TopStoriesViewModel: TopStoriesViewRetryAction {
    func retry() {
        guard var currData = collectionViewData,
            let errorSection = collectionViewData?.sectionModel(for: NewsSectionType.error.rawValue) else { return }
        currData.resetUpdate()
        currData.delete(section: errorSection)
        collectionViewData = currData
        viewUpdateHandler?(collectionViewData, nil)
        fetchTopStories()
    }
}

struct TopStoriesErrorMessage {
    // TODO: Error handling for different error types
    // Auto retry trigger based on error types
    static func errorMessage(for error: Error?) -> (String, String) {
        return ("Curently unable to load messages at this point of time, kindly retry.", "Retry")
    }
}
