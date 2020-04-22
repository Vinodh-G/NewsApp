//
//  UIView+Shadow.swift
//  NewsShared
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit

public extension UIView {
    func addShadow(shadowColor: UIColor = UIColor.black,
                   shadowOpacity: CGFloat = 0.5,
                   shadowRadius: CGFloat = 1,
                   shadowOffset: CGSize = .zero,
                   cornerRadius: CGFloat) {

        let layer = self.layer
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor.cgColor
        layer.cornerRadius = cornerRadius
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shouldRasterize = true
    }
}
