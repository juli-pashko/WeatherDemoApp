//
//  CityTableViewCell.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityImageView.image = nil
    }

    func setup(data: City, imageUrl: String) {
        cityNameLabel.text = data.name
        cityImageView.setImage(url: imageUrl, placeholder: nil)
        cityImageView.layer.cornerRadius = 9
    }

}
