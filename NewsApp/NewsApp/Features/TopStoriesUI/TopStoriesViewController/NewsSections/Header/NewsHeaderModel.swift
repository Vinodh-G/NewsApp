//
//  NewsHeaderModel.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit

struct NewsHeaderModel: HeaderViewModel {

    let headerTitle: String
    init(title: String) {
        headerTitle = title
    }

    var headerType: String {
        return ""
    }
}
