//
//  PluginManager.swift
//  Plugin
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation

public protocol Plugable {
    init()
    var pluginId: String { get }
    func plug() -> AnyObject?
}

public protocol PluginAPI {
    func load(pluginTypes: [Plugable.Type])
    func plugin(for pluginId: String) -> Plugable?
}

public class PluginManager: PluginAPI {

    static public let shared: PluginManager = PluginManager()
    private var plugins: [String: Plugable] = [:]

    public func load(pluginTypes: [Plugable.Type]) {

        pluginTypes.forEach { (pluginType) in
            let plugin = pluginType.init()
            plugins[plugin.pluginId] = plugin
        }
    }

    public func plugin(for pluginId: String) -> Plugable? {
        return plugins[pluginId]
    }
}
