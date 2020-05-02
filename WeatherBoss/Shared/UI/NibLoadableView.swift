//
//  NibLoadableView.swift
//  WeatherBoss
//
//  Created by Nischal Hada on 1/5/20.
//  Copyright © 2020 ArinAppy. All rights reserved.
//

import UIKit

protocol NibLoadableView: AnyObject {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UITableViewCell: NibLoadableView {}
