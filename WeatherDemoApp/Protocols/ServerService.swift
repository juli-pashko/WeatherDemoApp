//
//  ServerService.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 02.10.2022.
//

import Foundation

typealias ServerResponseCompletion<T> = (Result<T>) -> Void

/// The result of response serialization.
enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol ServerService {
    func performRequest<T>(_ request: URLRequestConvertible, completion: ServerResponseCompletion<T>?)
}

