//
//  CityWeatherRequest.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 02.10.2022.
//

import Foundation


struct CityWeatherRequest {
    let lat: Double
    let lon: Double
    let units = "metric"
    let key = Constants.openWeatherApiKey
    
    var query: [String: String] {
        var dict = [String: String]()
        dict["lat"] = String(lat)
        dict["lon"] = String(lon)
        dict["units"] = units
        dict["appid"] = key
        return dict
    }
}

