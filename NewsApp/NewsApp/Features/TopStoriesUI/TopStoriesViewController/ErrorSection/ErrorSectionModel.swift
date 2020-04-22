//
//  ErrorSectionModel.swift
//  VNews
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit

struct ErrorSectionModel: SectionModel {
    var sectionType: String {
        return NewsSectionType.error.rawValue
    }

    var header: HeaderViewModel? = nil
    var items: [CellModel]
    let sectionID: String
    
    init(errorMessage: String, actionTitle: String) {
        items = [ErrorCellModel(errorMessage: errorMessage, actionTitle: actionTitle)]
        sectionID = UUID().uuidString
    }
}
