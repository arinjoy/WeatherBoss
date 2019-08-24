//
//  WeatherListPresenting.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation

protocol WeatherListPresenting: class {
    
    /// Called when view did become ready
    func viewDidBecomeReady()
    
    /// Will load current weather status for a list of given cities
    func loadCurrentWeatherOfCities()
    
    /// Called when user taps an item form the weather list
    func didTapCityWeather(at index: Int)
}
