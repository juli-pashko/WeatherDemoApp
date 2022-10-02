//
//  CitiesCoordinator.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import UIKit

class CitiesCoordinator: Coordinator {
    // MARK: Properties
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    // MARK: Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(false, animated: true)
    }
    
    func start() {
        let citiesViewController = CitiesConfigurator().viewController(output: self)
        navigationController.setViewControllers([citiesViewController], animated: true)
    }
    
    private func showCityDetailScreen(with data: City) {
        let coordinator = CityDetailCoordinator(navigationController: navigationController, data: data)
        coordinator.output = self
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
    
    deinit {
        //TODO: CHECK IT!!! Otherwise add view controllers as weak.
        print("🗑 Deinited: \(self)")
    }
}


//MARK: CitiesOutput
extension CitiesCoordinator: CitiesOutput {
    func onSelectedCurrent(item: City) {
        print("Item ---> \(item)")
        showCityDetailScreen(with: item)
    }
}


//MARK: CityDetailCoordinatorOutput
extension CitiesCoordinator: CityDetailCoordinatorOutput {
    func onFinishCityDetail(coordinator: Coordinator) {
        removeChildCoordinator(coordinator)
    }
}

