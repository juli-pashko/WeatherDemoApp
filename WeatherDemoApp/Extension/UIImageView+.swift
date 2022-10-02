//
//  UIImageView+.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 02.10.2022.
//

import Foundation


import Kingfisher

extension UIImageView {
    /// Set `image` and/or `placeholder` using Kingfisher.
    func setImage(url: String?, placeholder: UIImage? = nil) {
        var resource: URL?
        if let url = url { resource = URL(string: url) }

        self.kf.indicatorType = .activity
        self.kf.setImage(with: resource,
                         placeholder: placeholder,
                         options: [
                            .processor(DownsamplingImageProcessor(size: self.frame.size)),
                            .scaleFactor(UIScreen.main.scale),
                            .cacheOriginalImage]
        )
    }
}

