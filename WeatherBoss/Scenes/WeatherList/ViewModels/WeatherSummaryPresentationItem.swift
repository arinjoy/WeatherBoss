//
//  WeatherSummaryPresentationItem.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

struct WeatherSummaryPresentationItem {
    // Note: Ideally these view model properties can be just more than flat string.
    // They can be NSAttributedString to capture text as well as font, style and color.
    // The relevant tranformers should have knowledge about the styles and create attributed strings
    // To simply passed around so that they can be attached to the UI labels to directly get the desired style

    let cityName: String
    let currentTemperature: String

    var accessibility: AccessibilityConfiguration?

    init(cityName: String,
         currentTemperature: String,
         accessibility: AccessibilityConfiguration? = nil) {
        self.cityName = cityName
        self.currentTemperature = currentTemperature
        self.accessibility = accessibility
    }
}
