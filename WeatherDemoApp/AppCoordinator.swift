//
//  AppCoordinator.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import UIKit


class AppCoordinator: Coordinator {
    
    // MARK: Properties
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
  
    // MARK: Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Public methods
    func start() {
        startCitiesFlow()
    }
    
    // MARK: Flows
    private func startCitiesFlow() {
        let coordinator = CitiesCoordinator(navigationController: navigationController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

}

