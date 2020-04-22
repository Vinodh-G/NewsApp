//
//  AppSpacing.swift
//  NewsShared
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit

public struct AppSpacing {

    public static let defaultSpacing: CGFloat = 20

    public struct FullWidthCell {

        public static let itemWidth: NSCollectionLayoutDimension = .fractionalWidth(1.0)
        public static let itemHeight: NSCollectionLayoutDimension = .fractionalHeight(1.0)

        public static let groupWidth: NSCollectionLayoutDimension = .fractionalWidth(0.95)
        public static let groupHeight: NSCollectionLayoutDimension = .absolute(220)
        public static let contentInset = NSDirectionalEdgeInsets(top: 0, leading: 0,
                                                        bottom: 0, trailing: 8)
    }

    public struct CardCell {

        public static let itemWidth: NSCollectionLayoutDimension = .fractionalWidth(1.0)
        public static let itemHeight: NSCollectionLayoutDimension = .fractionalHeight(1.0)

        public static let groupWidth: NSCollectionLayoutDimension = .absolute(260)
        public static let groupHeight: NSCollectionLayoutDimension = .absolute(230)
        public static let contentInset = NSDirectionalEdgeInsets(top: 0, leading: 16,
                                                                 bottom: 0, trailing: 0)
    }

    public struct ListCell {

        public static let itemWidth: NSCollectionLayoutDimension = .fractionalWidth(1.0)
        public static let itemHeight: NSCollectionLayoutDimension = .fractionalHeight(1.0)

        public static let groupWidth: NSCollectionLayoutDimension = .fractionalWidth(0.86)
        public static let groupHeight: NSCollectionLayoutDimension = .absolute(130)
        public static let contentInset = NSDirectionalEdgeInsets(top: 0, leading: 0,
                                                                 bottom: 0, trailing: 0)
    }

    public struct SectionHeader {

        public static let headerWidth: NSCollectionLayoutDimension = .fractionalWidth(1.0)
        public static let headerHeight: NSCollectionLayoutDimension = .estimated(30)
    }

    public static let defaultSectionContentInset = NSDirectionalEdgeInsets(top: 0,
                                                                        leading: 12,
                                                                        bottom: 0,
                                                                        trailing: 0)
}
