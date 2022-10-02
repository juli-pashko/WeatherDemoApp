//
//  CityModel.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import MapKit

struct City: Codable {
    let id: Int
    let name: String
    let state: String
    let country: String
    let coord: CityCoordinate
}

struct CityCoordinate: Codable {
    let lon: Double
    let lat: Double
    
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}

