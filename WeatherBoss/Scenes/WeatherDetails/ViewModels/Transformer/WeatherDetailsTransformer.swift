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
        var item = WeatherDetailsPresentationItem(
            cityName: input.cityName,
            shortDescription: input.shortDescription?.lowercased(),
            temperature: temperatureString(input.temperature),
            temperatureIcon: Theme.Icon.thermoTemp.icon,
            minTemperature: temperatureString(input.minTemperature),
            minTemperatureIcon: Theme.Icon.minTemp.icon,
            maxTemperature: temperatureString(input.maxTemperature),
            maxTemperatureIcon: Theme.Icon.maxTemp.icon,
            humidity: humidityString(input.humidity),
            humidityIcon: Theme.Icon.cloudHumid.icon,
            windSpeed: windSpeedString(input.windSpeed),
            windSpeedIcon: Theme.Icon.wind.icon,
            accessibility: nil
        )
        item.accessibility = itemAccessbility(input)

        return item
    }

    private func temperatureString(_ temperature: Double) -> String {
        var temrperatureString = formatter?.string(from: NSNumber(value: temperature)) ?? ""
        temrperatureString += " " + StringKeys.WeatherApp.temperatureUnit.localized()
        return temrperatureString
    }

    private func windSpeedString(_ windSpeed: Double) -> String {
        var windSpeedString = formatter?.string(from: NSNumber(value: windSpeed)) ?? ""
        windSpeedString += " " + StringKeys.WeatherApp.windSpeedUnit.localized()
        return windSpeedString
    }

    private func humidityString(_ humidity: Double) -> String {
        var humidityString = formatter?.string(from: NSNumber(value: humidity)) ?? ""
        humidityString += "% " + StringKeys.WeatherApp.humidityUnit.localized()
        return humidityString
    }

    private func itemAccessbility(_ input: CityWeather) -> WeatherDetailsPresentationItem.Accessibility {
        return WeatherDetailsPresentationItem.Accessibility(
            currentTemperatureAccessibility: AccessibilityConfiguration(
                identifier: "accessibilityId.weatherDetails.currentTemp",
                label: createCombinedAccessibilityLabel(
                    from: ["Current temperature", temperatureString(input.temperature)]
                )
            ),
            minTemperatureAccessibility: AccessibilityConfiguration(
                identifier: "accessibilityId.weatherDetails.minTemp",
                label: createCombinedAccessibilityLabel(
                    from: ["Minimum temperature", temperatureString(input.minTemperature)]
                )
            ),
            maxTemperatureAccessibility: AccessibilityConfiguration(
                identifier: "accessibilityId.weatherDetails.maxTemp",
                label: createCombinedAccessibilityLabel(
                    from: ["Maximum temperature", temperatureString(input.maxTemperature)]
                )
            ),
            humidityAccessibility: AccessibilityConfiguration(
                identifier: "accessibilityId.weatherDetails.humidity",
                label: createCombinedAccessibilityLabel(
                    from: [StringKeys.WeatherApp.humidityPrefix.localized(), humidityString(input.humidity)]
                )
            ),
            windSpeedAccessibility: AccessibilityConfiguration(
                identifier: "accessibilityId.weatherDetails.windSpeed",
                label: createCombinedAccessibilityLabel(
                    from: [StringKeys.WeatherApp.windSpeedPreix.localized(), windSpeedString(input.windSpeed)]
                )
            )
        )
    }
}
