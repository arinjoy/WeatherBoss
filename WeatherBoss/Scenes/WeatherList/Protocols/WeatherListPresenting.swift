//
//  WeatherListPresenting.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation

protocol WeatherListPresenting {
    
    /// Will load current weather status for a list of given cities
    ///
    /// - Parameter cities: The list of identifier of the cities
    func loadCurrentWeather(forCities cities: [String])
}
