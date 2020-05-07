//
//  Theme+Icon.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

extension Theme {
    enum Icon: String {
        case weather = "weather-icon"
        case weatherFilled = "weather-icon-filled"

        case settings = "settings-icon"
        case settingsFilled = "settings-icon-filled"

        case thermoTemp = "temperature-icon"
        case minTemp = "min-temp-icon"
        case maxTemp = "max-temp-icon"

        case cloudHumid = "cloud-humid-icon"
        case wind = "wind-icon"

        var icon: UIImage {
            guard let image = UIImage(named: rawValue)
            else {
              fatalError("Image resource \(rawValue) cannot be loaded")
            }
            return image.withRenderingMode(.alwaysTemplate)
        }
    }
}
