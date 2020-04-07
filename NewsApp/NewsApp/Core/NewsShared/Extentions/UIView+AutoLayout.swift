//
//  UIView+AutoLayout.swift
//  NewsShared
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit

public extension UIView {
    convenience init(autoLayout: Bool) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = !autoLayout
    }
}
