//
//  LoadingSectionModel.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation
import VSCollectionKit

struct LoadingSectionModel: SectionModel {
    var sectionType: String {
        return NewsSectionType.loading.rawValue
    }
    var header: HeaderViewModel?
    var items: [CellModel] = []
    let sectionID: String
    init() {
        items.append(LoadingCellModel())
        sectionID = UUID().uuidString
    }
}
