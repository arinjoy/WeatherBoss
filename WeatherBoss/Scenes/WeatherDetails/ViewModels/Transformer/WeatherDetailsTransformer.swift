//
//  WeatherDetailsTransformer.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

struct WeatherDetailsTransformer: DataTransforming {
    
    /// Number formatter helper
    private let formatter: NumberFormatter?
    
    init() {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        self.formatter = formatter
    }
    
    func transform(input: CityWeather) -> WeatherDetailsPresentationItem {
        return WeatherDetailsPresentationItem(
            cityName: input.cityName,
            shortDescription: input.shortDescription?.lowercased(),
            temperature: temperatureString(input.temperature),
            temperatureIcon: Theme.Icon.thermoTemp.icon,
            minTemperature: temperatureString(input.minTemperature),
            minTemperatureIcon: Theme.Icon.minTemp.icon,
            maxTemperature: temperatureString(input.maxTemperature),
            maxTemperatureIcon: Theme.Icon.maxTemp.icon,
            windSpeed: windSpeedString(input.windSpeed),
            windSpeedIcon: Theme.Icon.wind.icon,
            humidity: humidityString(input.humidity),
            humidityIcon: Theme.Icon.cloudHumid.icon
        )
    }
    
    private func temperatureString(_ temperature: Double) -> String {
        var temrperatureString = formatter?.string(from: NSNumber(value: temperature)) ?? ""
        temrperatureString += " °C"
        return temrperatureString
    }
    
    private func windSpeedString(_ windSpeed: Double) -> String {
        var windSpeedString = formatter?.string(from: NSNumber(value: windSpeed)) ?? ""
        windSpeedString += " m/s"
        return windSpeedString
    }
    
    private func humidityString(_ humidity: Double) -> String {
        var humidityString = formatter?.string(from: NSNumber(value: humidity)) ?? ""
        humidityString += "% hpa"
        return humidityString
    }
}
