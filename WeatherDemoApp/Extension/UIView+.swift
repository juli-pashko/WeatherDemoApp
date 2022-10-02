//
//  UIView+.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 01.10.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(
        _ corners: UIRectCorner,
        radius: CGFloat,
        borderColor: UIColor = .white,
        borderWidth: CGFloat = 0.0) {
            
            if #available(iOS 11.0, *) {
                layer.borderColor = borderColor.cgColor
                layer.borderWidth = borderWidth
                clipsToBounds = true
                layer.cornerRadius = radius
                layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
            } else {
                let rectShape = CAShapeLayer()
                rectShape.bounds = self.frame
                rectShape.position = self.center
                rectShape.path = UIBezierPath(
                    roundedRect: self.bounds,
                    byRoundingCorners: corners,
                    cornerRadii: CGSize(width: radius, height: radius)).cgPath
                layer.mask = rectShape
                
                let borderLayer = CAShapeLayer()
                borderLayer.path = rectShape.path // Reuse the Bezier path
                borderLayer.fillColor = UIColor.clear.cgColor
                borderLayer.strokeColor = UIColor.white.cgColor
                borderLayer.lineWidth = 5
                borderLayer.frame = self.bounds
                layer.addSublayer(borderLayer)
            }
        }
    
}




