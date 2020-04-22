//
//  LoadingCellModel.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation
import VSCollectionKit

struct LoadingCellModel: CellModel {
    var cellID: String
    var cellType: String {
        return NewsCellType.loadingskeleton.rawValue
    }

    init() {
        cellID = UUID().uuidString
    }
}
