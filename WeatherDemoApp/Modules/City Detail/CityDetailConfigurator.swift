//
//  CityDetailConfigurator.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation


class CityDetailConfigurator {
    func viewController(output: CityDetailOutput, data: City) -> CityDetailViewController {
        let viewController = CityDetailViewController.from(storyboard: .cityDetail)
        let presenter = CityDetailPresenter(view: viewController, data: data)
        viewController.setPresenter(presenter)
        presenter.set(output)
        return viewController
    }
}

