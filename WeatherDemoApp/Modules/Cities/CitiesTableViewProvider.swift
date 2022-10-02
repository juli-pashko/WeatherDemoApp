//
//  CitiesTableViewProvider.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import UIKit


protocol CitiesTableViewProviderDelegate: AnyObject {
    func didSelect(item: City)
}

class CitiesTableViewProvider: NSObject, TableViewProvider {
    //MARK: Public properties
    var data = [City]()
    weak var delegate: CitiesTableViewProviderDelegate?
    
    //MARK: Private properties
    private let evenImageUrl = "https://infotech.gov.ua/storage/img/Temp3.png"
    private let oddImageUrl = "https://infotech.gov.ua/storage/img/Temp1.png"
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as! CityTableViewCell
        let url = indexPath.row % 2 == 0 ? oddImageUrl : evenImageUrl
        cell.setup(data: data[indexPath.row], imageUrl: url)
        return cell
    }
    
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        delegate?.didSelect(item: item)
    }
    
}

