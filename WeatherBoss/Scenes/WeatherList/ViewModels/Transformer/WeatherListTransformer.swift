//
//  WeatherListTransformer.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation

struct WeatherListTransformer: DataTransforming {
    
    /// Number formatter helper
    private let formatter: NumberFormatter?
    
    init() {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        self.formatter = formatter
    }
    
    func transform(input: [CityWeather]) -> WeatherListDataSource {
        let presentationItems: [WeatherSummaryPresentationItem] = input.map { item  in
            
            var temrperatureString = formatter?.string(from: NSNumber(value: item.temperature)) ?? ""
            temrperatureString += " " + StringKeys.WeatherApp.temperatureUnit.localized()
            
            var item = WeatherSummaryPresentationItem(
                cityName: item.cityName,
                currentTemperature: temrperatureString)
            
            item.accessibility = AccessibilityConfiguration(
                identifier: "weatherApp.accessibilityId.weatherCell",
                label: createCombinedAccessibilityLabel(from: [item.cityName, item.currentTemperature]),
                hint: StringKeys.WeatherApp.weatherListItemAccessibilityHint.localized(),
                traits: .button)
            
            return item
        }
        
        let dataSections = [DataSection<WeatherSummaryPresentationItem>(items: presentationItems)]
        return DataSource<DataSection<WeatherSummaryPresentationItem>>(sections: dataSections)
    }
}
