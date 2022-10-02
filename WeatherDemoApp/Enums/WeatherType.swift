//
//  WeatherType.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 02.10.2022.
//

import UIKit


enum WeatherType: String {
   case clear = "Clear"
   case clouds = "Clouds"
   case rain = "Rain"
   case thunderstorm = "Thunderstorm"
   case drizzle = "Drizzle"
   case snow = "Snow"

    
    var image: UIImage? {
        switch self {
        case .clear:
            return UIImage(systemName: "sun.max")
        case .clouds:
            return UIImage(systemName: "cloud")
        case .rain:
            return UIImage(systemName: "cloud.rain")
        case .thunderstorm:
            return UIImage(systemName: "cloud.bolt")
        case .drizzle:
            return UIImage(systemName: "cloud.drizzle")
        case .snow:
            return UIImage(systemName: "cloud.snow")
        }
    }

}

