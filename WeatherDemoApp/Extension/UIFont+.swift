//
//  UIFont+.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 01.10.2022.
//

import UIKit

extension UIFont {
    /// Main font family of the app is `Montserrat` now.
    static func mainFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
        case .light: return UIFont(name: "Montserrat-Light", size: fontSize)!
        case .medium: return UIFont(name: "Montserrat-Medium", size: fontSize)!
        case .semibold: return UIFont(name: "Montserrat-SemiBold", size: fontSize)!
        case .bold: return UIFont(name: "Montserrat-Bold", size: fontSize)!
        default: return UIFont(name: "Montserrat-Regular", size: fontSize)!
        }
    }
}

