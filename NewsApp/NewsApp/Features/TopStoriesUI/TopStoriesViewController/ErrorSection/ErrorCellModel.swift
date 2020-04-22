//
//  ErrorCellModel.swift
//  VNews
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit

struct ErrorCellModel: CellModel {
    var cellType: String {
        return NewsCellType.error.rawValue
    }

    let errorMessage: String
    let actionTitle: String
    let cellID: String
    init(errorMessage: String, actionTitle: String) {
        self.errorMessage = errorMessage
        self.actionTitle = actionTitle
        cellID = UUID().uuidString
    }
}
