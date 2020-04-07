//
//  NewsDetailUIAPI.swift
//  Plugin
//
//  Created by Vinodh Govindaswamy on 27/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit

public let NewsDetailsUIPluginId: String = "NewsDetailsUIPluginId"

public struct NewsDetailsPageParam {
    public let pageId: String
    public let data: Any
    public init (pageId: String, data: Any) {
        self.pageId = pageId
        self.data = data
    }
}

public protocol NewsDetailsUIAPI {
    func newsDetailsViewController(param: NewsDetailsPageParam) -> UIViewController?
}
