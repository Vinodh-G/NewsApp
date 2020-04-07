//
//  TopStoriesPlugin.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Plugin

public class TopStoriesPlugin: Plugable {

    public required init() {}

    public var pluginId: String {
        return TopStoriesUIPluginId
    }

    public func plug() -> AnyObject? {
        return TopStoriesAPIPrivate()
    }
}
