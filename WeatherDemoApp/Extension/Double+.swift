//
//  Double+.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 02.10.2022.
//

import Foundation


extension Double {
   
    func stringCelsius() -> String  {
        return  String(format: "%.0f", self) + "°"
    }
    
}
