//
//  UITableView+.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import UIKit

extension UITableView {

    func register(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }

}
