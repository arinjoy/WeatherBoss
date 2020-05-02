//
//  ReusableView.swift
//  WeatherBoss
//
//  Created by Nischal Hada on 1/5/20.
//  Copyright © 2020 ArinAppy. All rights reserved.
//

import UIKit

protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}
