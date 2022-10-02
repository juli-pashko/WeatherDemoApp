//
//  CityDetailCoordinator.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import UIKit


protocol CityDetailCoordinatorOutput: AnyObject {
    func onFinishCityDetail(coordinator: Coordinator)
}

class CityDetailCoordinator: Coordinator {
  
    let navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    weak var output: CityDetailCoordinatorOutput?
    
    let data: City
   
   
    init(navigationController: UINavigationController,
        data: City) {
        self.navigationController = navigationController
        self.data = data
    }
    
    func start() {
        let cityDetailViewController = CityDetailConfigurator().viewController(output: self, data: data)
        navigationController.pushViewController(cityDetailViewController, animated: true)
    }
    
    deinit {
        //TODO: CHECK IT!!! Otherwise add view controllers as weak.
        print("🗑 Deinited: \(self)")
    }
}

//MARK: CityDetailOutput
extension CityDetailCoordinator: CityDetailOutput {
    func onBackButton() {
        popViewController(animated: true)
        output?.onFinishCityDetail(coordinator: self)
    }
}
