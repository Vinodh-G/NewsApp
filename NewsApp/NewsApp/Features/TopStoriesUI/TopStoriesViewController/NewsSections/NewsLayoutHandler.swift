//
//  NewsLayoutHandler.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 27/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import AppConfigService
import NewsShared
import UIKit
import VSCollectionKit

enum NewsSectionLayoutType: String {
    case fullWidthCard
    case card
    case groupedList
    case list
}

class NewsLayoutHandler {
    static func layoutType(for newsCatType: String) -> NewsSectionLayoutType {
        switch newsCatType {
        case TopStoriesUIConfig.worldNewsCategory.type:
            return .fullWidthCard

        case TopStoriesUIConfig.usNewsCategory.type:
            return .list

        case TopStoriesUIConfig.sportsNewsCategory.type: fallthrough
        case TopStoriesUIConfig.businessNewsCategory.type: fallthrough
        case TopStoriesUIConfig.scienceNewsCategory.type: fallthrough
        case TopStoriesUIConfig.technologyNewsCategory.type:
            return .card
            
        default:
            return .groupedList
        }
    }

    static func sectionLayout(layoutType: NewsSectionLayoutType) -> NSCollectionLayoutSection? {

        var sectionLayout: NSCollectionLayoutSection?
        switch layoutType {
        case .fullWidthCard:
            let groupLayout = fullWidthItemLayout()
            sectionLayout = NSCollectionLayoutSection(group: groupLayout)
            sectionLayout?.orthogonalScrollingBehavior = .groupPaging

        case .card:
            let groupLayout = cardItemLayout()
            sectionLayout = NSCollectionLayoutSection(group: groupLayout)
            sectionLayout?.orthogonalScrollingBehavior = .groupPaging

        case .list:
            let groupLayout = listItemLayout()
            sectionLayout = NSCollectionLayoutSection(group: groupLayout)
            sectionLayout?.orthogonalScrollingBehavior = .groupPaging

        case .groupedList:
            let groupLayout = groupedListItemLayout()
            sectionLayout = NSCollectionLayoutSection(group: groupLayout)
            sectionLayout?.orthogonalScrollingBehavior = .groupPaging
        }

        let headerSize = NSCollectionLayoutSize(widthDimension: AppSpacing.SectionHeader.headerWidth,
                                                     heightDimension: AppSpacing.SectionHeader.headerHeight)
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: NewsSectionHandler.sectionHeaderKind,
            alignment: .top)
        sectionLayout?.boundarySupplementaryItems = [sectionHeader]
        sectionLayout?.contentInsets = AppSpacing.defaultSectionContentInset

        return sectionLayout
    }

    static func fullWidthItemLayout() -> NSCollectionLayoutGroup {

        let itemSize = NSCollectionLayoutSize(widthDimension: AppSpacing.FullWidthCell.itemWidth,
                                              heightDimension: AppSpacing.FullWidthCell.itemHeight)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = AppSpacing.FullWidthCell.contentInset
        let groupSize = NSCollectionLayoutSize(widthDimension: AppSpacing.FullWidthCell.groupWidth,
                                               heightDimension: AppSpacing.FullWidthCell.groupHeight)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
        return group
    }

    static func listItemLayout() -> NSCollectionLayoutGroup {

        let itemSize = NSCollectionLayoutSize(widthDimension: AppSpacing.ListCell.itemWidth,
                                              heightDimension: AppSpacing.ListCell.itemHeight)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: AppSpacing.ListCell.groupWidth,
                                               heightDimension: AppSpacing.ListCell.groupHeight)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitem: item,
                                                     count: 1)
        return group
    }

    static func groupedListItemLayout() -> NSCollectionLayoutGroup {

        let itemSize = NSCollectionLayoutSize(widthDimension: AppSpacing.ListCell.itemWidth,
                                              heightDimension: AppSpacing.ListCell.itemHeight)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: AppSpacing.ListCell.groupWidth,
                                               heightDimension: .absolute(120 * 3))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitem: item,
                                                     count: 3)
        return group
    }

    static func cardItemLayout() -> NSCollectionLayoutGroup {

        let itemSize = NSCollectionLayoutSize(widthDimension: AppSpacing.CardCell.itemWidth,
                                              heightDimension: AppSpacing.CardCell.itemHeight)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: AppSpacing.CardCell.groupWidth,
                                               heightDimension: AppSpacing.CardCell.groupHeight)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        return group
    }
}
