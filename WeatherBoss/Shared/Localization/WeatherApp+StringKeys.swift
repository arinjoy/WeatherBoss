//
//  WeatherApp+StringKeys.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation

extension StringKeys {
    
    enum WeatherApp: String, LocalizationKeys {
        
        case homeTabName = "home.tab.name"
        case settingsTabName = "settings.tab.name"
        
        case temperatureUnit = "weather.detail.temp.unit"
        case minTempPrefix = "weather.detail.minTemp.prefix"
        case maxTempPrefix = "weather.detail.maxTemp.prefix"
        
        case humidityUnit = "weather.detail.humidity.unit"
        case humidityPrefix = "weather.detail.humidity.prefix"
        
        case windSpeedUnit = "weather.detail.windSpeed.unit"
        case windSpeedPreix = "weather.detail.windSpeed.prefix"
        
        case settingsAppearenceHeading = "settings.heading.appearence"
        case settingsAppInfoHeading = "settings.heading.appInfo"
        case settingsDarkMode = "settings.list.item.darkMode"
        case settingsVersion = "settings.list.item.version"
        
        case genericErrorTitle = "error.generic.alert.title"
        case genericErrorMessage = "error.generic.alert.message"
        case genericErrorDismiss = "error.generic.alert.dismiss"
        
        case weatherListItemAccessibilityHint = "weather.list.item.accessibility.hint"
        

        // MARK: - LocalizationKeys
        
        var table: String? { return "WeatherApp" }
    }
}

