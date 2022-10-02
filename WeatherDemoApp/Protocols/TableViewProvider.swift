//
//  TableViewProvider.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import UIKit

protocol TableViewProvider: UITableViewDataSource, UITableViewDelegate { }

protocol TableViewProviderDelegate: AnyObject {
    func didSelectItem(at index: Int)
}

