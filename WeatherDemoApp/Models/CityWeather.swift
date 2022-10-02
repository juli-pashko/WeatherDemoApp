//
//  CityWeather.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 02.10.2022.
//

import Foundation


struct CityWeather: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

struct Weather: Codable {
    let main: String
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Double
    
    var currentTemp: String {
        return temp.stringCelsius()
    }
    
    var minTemp: String {
        return temp_min.stringCelsius()
    }
    
    var maxTemp: String {
        return temp_max.stringCelsius()
    }
    
    var humidityPercent: String {
        return "\(String(humidity))%"
    }
    
}

struct Wind: Codable {
    let speed: Double
    
    var windSpeed: String {
        return "\(String(speed)) km/h"
    }

}

