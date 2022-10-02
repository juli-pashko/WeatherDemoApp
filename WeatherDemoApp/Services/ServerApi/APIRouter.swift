//
//  APIRouter.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 02.10.2022.
//

import Foundation
import Alamofire

protocol URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var query: [String: String]? { get }
    
    func asURLRequest() throws -> URLRequest
}

enum APIRouter: URLRequestConvertible {
    case getCityWeather(_ request: CityWeatherRequest)
    
    // MARK: HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getCityWeather:
            return .get
        }
    }
    
    // MARK: Path
    var path: String {
        switch self {
        case .getCityWeather:
            return "weather"
        }
    }
    
    // MARK: Parameters
    var parameters: Parameters? {
        switch self {
        case .getCityWeather:
            return nil
        }
    }
    
    // MARK: Query
    var query: [String: String]? {
        switch self {
        case .getCityWeather(of: let request):
            return request.query
        }
    }
}

extension URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var url = try Constants.baseURL.asURL()
        
        // Query
        if let query = query, var components = URLComponents(string: url.absoluteString) {
            components.queryItems = query.map { element in URLQueryItem(name: element.key, value: element.value) }
            url = components.url!
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

