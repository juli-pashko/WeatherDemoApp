//
//  Constants.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 02.10.2022.
//

import Foundation


struct APIParameterKey {
    static let name = "name"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

struct Constants {
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
    static let openWeatherApiKey = "d63bb711dcd8f014f6134a1b36de6f36"
}
