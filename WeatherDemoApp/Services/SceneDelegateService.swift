//
//  SceneDelegateService.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import UIKit

class SceneDelegateService {
    // MARK: Properties
    let window: UIWindow!
    var appCoordinator: AppCoordinator!
    
    
    // MARK: Initialization
    init(window: UIWindow) {
        self.window = window
    }
    
    
    // MARK: Public methods
    func setupAppCoordinator() {
        window.rootViewController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: window.rootViewController as! UINavigationController)
        appCoordinator.start()
        window.makeKeyAndVisible()
    }
}


