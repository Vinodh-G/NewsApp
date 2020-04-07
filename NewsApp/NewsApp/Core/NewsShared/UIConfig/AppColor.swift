//
//  AppColor.swift
//  NewsShared
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit

public class AppColor {

    public static let defaultBackgroundColor: UIColor = UIColor.init(red: 245.0/255,
                                                                     green: 245.0/255,
                                                                     blue: 245.0/255, alpha: 1)

    public static let defaultTitleTextColor: UIColor = UIColor.init(white: 0, alpha: 0.9)
    public static let defaultContentTextColor: UIColor = UIColor.init(white: 0, alpha: 0.7)
    public static let defaulttimeStampTextColor: UIColor = UIColor.init(white: 0, alpha: 0.7)

    public static let highlightTitleTextColor: UIColor = UIColor.init(white: 1, alpha: 1)
    public static let highlighttimeStampTextColor: UIColor = UIColor.init(white: 0, alpha: 0.7)

    public static let defaultShadowColor: UIColor = UIColor.black

    public struct ErrorCell {
        public static let errorTitleColor: UIColor = .darkGray
        public static let actionButtonTint: UIColor = UIColor.init(white: 0, alpha: 0.7)
        public static let actionButtonBorder: UIColor = UIColor.init(white: 0, alpha: 0.3)
    }
}
