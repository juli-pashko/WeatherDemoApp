//
//  WeatherServerService.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 02.10.2022.
//

import Foundation


class WeatherServerService {
    
    typealias GetCityWeatherCompletion = (CityWeather?, Error?) -> Void
    
    
    // MARK: Private properties
    private let core: ServerService
    
    
    // MARK: Initialization
    init(core: ServerService) {
        self.core = core
    }
    
    
    // MARK: Public methods
    func getCityWeather(_ request: CityWeatherRequest, completion: @escaping GetCityWeatherCompletion) {
        core.performRequest(APIRouter.getCityWeather(request)) { (result: Result<Data>) in
            switch result {
            case .success(let data):
                completion(self.parseCityWeather(data: data), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
    // MARK: Private methods
    func parseCityWeather(data: Data) -> CityWeather? {
        do {
            let weather = try JSONDecoder().decode(CityWeather.self, from: data)
            return weather
        } catch {
            return nil
        }
    }
}

