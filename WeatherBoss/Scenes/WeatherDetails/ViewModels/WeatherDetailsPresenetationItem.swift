//
//  WeatherDetailsPresenetationItem.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

struct WeatherDetailsPresentationItem {
    
    let cityName: String
    let shortDescription: String?
    
    let temperature: String
    let temperatureIcon: UIImage?
    
    let minTemperature: String
    let minTemperatureIcon: UIImage?
    
    let maxTemperature: String
    let maxTemperatureIcon: UIImage?
    
    let humidity: String
    let humidityIcon: UIImage?
    
    let windSpeed: String
    let windSpeedIcon: UIImage?
    
    struct Accessibility {
        let currentTemperatureAccessibility: AccessibilityConfiguration
        let minTemperatureAccessibility: AccessibilityConfiguration
        let maxTemperatureAccessibility: AccessibilityConfiguration
        let humidityAccessibility: AccessibilityConfiguration
        let windSpeedAccessibility: AccessibilityConfiguration
    }
    
    var accessibility: Accessibility?
}
