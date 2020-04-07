//
//  NewsDetailPlugin.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Plugin

public class NewsDetailPlugin: Plugable {

    public required init() {}

    public var pluginId: String {
        return NewsDetailsUIPluginId
    }

    public func plug() -> AnyObject? {
        return NewsDetailAPIPrivate()
    }
}
