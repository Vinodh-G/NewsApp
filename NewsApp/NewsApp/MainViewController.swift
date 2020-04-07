//
//  MainViewController.swift
//  NewsApp
//
//  Created by Vinodh Govindaswamy on 07/04/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Plugin
import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabViewController()
    }


    func topStoriesViewController() -> UIViewController? {
        guard let topStoriesPlugin = PluginManager.shared.plugin(for: TopStoriesUIPluginId)?.plug() as? TopStoriesUIAPI,
            let storiesView = topStoriesPlugin.topStoriesViewController(pageId: "home") else { return nil }
        return storiesView
    }

    func setUpTabViewController() {

        let tabBarController = UITabBarController()
        guard let topStoriesView = topStoriesViewController() else { return }
        let navigationController = UINavigationController(rootViewController: topStoriesView)
        navigationController.view.backgroundColor = navigationController.navigationBar.barTintColor

        tabBarController.setViewControllers([navigationController], animated: false)

        view.addSubview(tabBarController.view)
        addChild(tabBarController)
    }
}
