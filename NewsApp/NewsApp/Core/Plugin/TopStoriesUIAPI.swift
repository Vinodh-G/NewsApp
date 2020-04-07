//
//  TopStoriesUIAPI.swift
//  Plugin
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit

public let TopStoriesUIPluginId: String = "TopStoriesUIPlugin"

public protocol TopStoriesUIAPI {
    func topStoriesViewController(pageId: String) -> UIViewController?
}
