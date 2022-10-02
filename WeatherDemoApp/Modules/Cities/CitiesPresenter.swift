//
//  CitiesPresenter.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import UIKit

//MARK: Output
protocol CitiesOutput: AnyObject {
    func onSelectedCurrent(item: City)
}

//MARK: Presentation
protocol CitiesPresentation: AnyObject {
    func onViewDidLoad()
    func onSearching(_ string: String?)
    func onStopSearching()
}



class CitiesPresenter {
    //MARK: Properties
    private weak var view: CitiesInterface!
    private weak var output: CitiesOutput!
    
    
    lazy var tableViewProvider: CitiesTableViewProvider = {
        let tableViewProvider = CitiesTableViewProvider()
        tableViewProvider.delegate = self
        return tableViewProvider
    }()
    
    let data: [City] = Bundle.main.decode("city_list.json")
    
    //MARK: Initialization
    init(view: CitiesInterface) {
        self.view = view
    }
    
    //MARK: Public methods
    func set(_ output: CitiesOutput) {
        self.output = output
    }
    
    // MARK: Private methods
    private func loadData() {
        tableViewProvider.data = data
        view.reloadData()
    }
    
    private func handleSearching(_ string: String?) {
        guard let searchingString = string, !searchingString.isEmpty else {
            tableViewProvider.data = data
            view.reloadData()
            return
        }
        
        tableViewProvider.data = tableViewProvider.data.filter { $0.name.lowercased().contains(searchingString.lowercased()) }
        view.reloadData()
    }
   
    private func handleStopSearching() {
        tableViewProvider.data = data
        view.reloadData()
    }
}


//MARK: CitiesPresentation
extension CitiesPresenter: CitiesPresentation {
   
    func onViewDidLoad() {
        loadData()
        view.setTableView(provider: tableViewProvider)
    }
    
    func onSearching(_ string: String?) {
        handleSearching(string)
    }
    
    func onStopSearching() {
        handleStopSearching()
    }
}


//MARK: CitiesTableViewProviderDelegate
extension CitiesPresenter: CitiesTableViewProviderDelegate {
    func didSelect(item: City) {
        output.onSelectedCurrent(item: item)
    }
}
