//
//  CityDetailTableViewProvider.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import UIKit

protocol CityDetailTableViewProviderDelegate: AnyObject {
    func didSelect(item: City)
    func scrollViewDidScroll()
}

class CityDetailTableViewProvider: NSObject, TableViewProvider {
    
    //MARK: Public properties
    var data = [CityWeather]()
    weak var delegate: CityDetailTableViewProviderDelegate!

 
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.populate(with: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }
    
    
    //MARK: ScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate.scrollViewDidScroll()
    }
}
