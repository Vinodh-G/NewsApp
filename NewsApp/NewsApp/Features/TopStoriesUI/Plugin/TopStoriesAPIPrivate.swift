//
//  TopStoriesAPIPrivate.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit
import Plugin

class TopStoriesAPIPrivate: TopStoriesUIAPI {

    func topStoriesViewController(pageId: String) -> UIViewController? {
        let viewModel = TopStoriesViewModel(newsPageName: pageId)
        let topStoriesViewController = TopStoriesViewController()
        topStoriesViewController.viewModel = viewModel
        return topStoriesViewController
    }
}
