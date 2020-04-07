//
//  VNSectionHandlerProtocol.swift
//  VSCollectionKit
//
//  Created by Vinodh Govindaswamy on 07/04/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit

public protocol SectionHandler: SectionLayoutInfo, SectionHeaderFooter, SectionDelegateHandler {
    var type: String { get }
    func registerCells(for collectionView: UICollectionView)
    func cellProvider(_ collectionView: UICollectionView,
                      _ indexPath: IndexPath,
                      _ cellModel: CellModel) -> UICollectionViewCell
}

public protocol SectionHeaderFooter: AnyObject {
    func supplementaryView(collectionView: UICollectionView,
                           kind: String,
                           indexPath: IndexPath,
                           headerViewModel: HeaderViewModel) -> UICollectionReusableView?
}

public extension SectionHeaderFooter {
    func supplementaryView(collectionView: UICollectionView,
                           kind: String,
                           indexPath: IndexPath,
                           headerViewModel: HeaderViewModel) -> UICollectionReusableView? {
        return nil
    }
}

public protocol SectionLayoutInfo: AnyObject {
    func collectionLayout(for sectionModel: SectionModel,
                          environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?
}

public extension SectionLayoutInfo  {
    func collectionLayout(for sectionModel: SectionModel,
                          environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        return nil
    }
}

public protocol SectionDelegateHandler: AnyObject {
    func didSelect(_ collectionView: UICollectionView,
                   _ indexPath: IndexPath,
                   _ cellModel: CellModel)
}

public extension SectionDelegateHandler {
    func didSelect(_ collectionView: UICollectionView,
                   _ indexPath: IndexPath,
                   _ cellModel: CellModel) {}
}

public protocol SectionModel {
    var sectionType: String { get }
    var header: HeaderViewModel? { get }
    var items: [CellModel] { get set }
}

public protocol HeaderViewModel {
    var headerType: String { get }
}

public protocol CellModel {
    var cellType: String { get }
}
