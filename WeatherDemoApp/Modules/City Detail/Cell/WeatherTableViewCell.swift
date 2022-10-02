//
//  WeatherTableViewCell.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 30.09.2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    @IBOutlet weak var currentTempLable: UILabel!
    @IBOutlet weak var minTempLable: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    func populate(with item: CityWeather) {
        let descr = item.weather.first?.main ?? ""
        descrLabel.text = descr
        weatherImageView.image = WeatherType(rawValue: descr)?.image
        cityNameLabel.text = item.name
        currentTempLable.text = item.main.currentTemp
        minTempLable.text = item.main.minTemp
        maxTempLabel.text = item.main.maxTemp
        humidityLabel.text = item.main.humidityPercent
        windLabel.text = item.wind.windSpeed
    }
    
}

