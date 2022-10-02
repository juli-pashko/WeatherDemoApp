//
//  CitiesConfigurator.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation

class CitiesConfigurator {
    func viewController(output: CitiesOutput) -> CitiesViewController {
        let viewController = CitiesViewController.from(storyboard: .cities)
        let presenter = CitiesPresenter(view: viewController)
        viewController.setPresenter(presenter)
        presenter.set(output)
        return viewController
    }
}
