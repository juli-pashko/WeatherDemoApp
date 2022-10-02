//
//  CityDetailPresenter.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import UIKit


//MARK: Output
protocol CityDetailOutput: AnyObject {
    func onBackButton()
}

//MARK: Presentation
protocol CityDetailPresentation: AnyObject {
    func onViewDidLoad()
    func onDismissAction()
}


class CityDetailPresenter {
    
    //MARK: Properties
    private var data: City
    
    private weak var view: CityDetailInterface!
    private weak var output: CityDetailOutput!

    private var mapSnapshotService: MapSnapshotService?
    private var weatherServerService = WeatherServerService(core: URLSessionService())
    
    
    lazy var tableViewProvider: CityDetailTableViewProvider = {
        let tableViewProvider = CityDetailTableViewProvider()
        tableViewProvider.delegate = self
        return tableViewProvider
    }()
    
    
    
    //MARK: Initialization
    init(view: CityDetailInterface, data: City) {
        self.view = view
        self.data = data
    }
    
    //MARK: Public methods
    func set(_ output: CityDetailOutput) {
        self.output = output
    }
    
    private func loadData() {
        mapSnapshotService = MapSnapshotService(latitude: self.data.coord.lat, longitude: self.data.coord.lon)
        fetchMapSnapshot()
        fetchCurrenntCityWeather()
    }
    
    private func fetchCurrenntCityWeather() {
        let request = CityWeatherRequest(lat: data.coord.lat, lon: data.coord.lon)
        weatherServerService.getCityWeather(request) { [weak self] cityWeather, error in
            guard let self = self, let data = cityWeather else { return }
            self.tableViewProvider.data = [data]
            self.view.reloadData()
        }
    }
    
    private func fetchMapSnapshot( ) {
        mapSnapshotService?.snapshotterStart { [weak self] image, error in
            guard let self = self else { return }
            if let image = image {
                DispatchQueue.main.async {
                    self.view.setHeader(image: image)
                }
            } else if let error = error {
                print("Snapshotter error: \(error.localizedDescription)")
            }
        }
    }

}



//MARK: CityDetailPresentation
extension CityDetailPresenter: CityDetailPresentation {
    func onViewDidLoad() {
        loadData()
        view.setTableView(provider: tableViewProvider)
    }
    
    func onDismissAction() {
        output.onBackButton()
    }
}


//MARK: CityDetailTableViewProviderDelegate
extension CityDetailPresenter: CityDetailTableViewProviderDelegate {
    func didSelect(item: City) {
        
    }
    
    func scrollViewDidScroll() {
        view.scrollViewDidScroll()
    }
    
}
