//
//  NameDescribable.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation


/// A way to get a *typeName* or *Identifier*. A common case to use while initializing *NameTableViewCell.identifier*.
protocol NameDescribable { }
extension NameDescribable {
    var typeName: String {
        return String(describing: type(of: self))
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension NSObject: NameDescribable { }

