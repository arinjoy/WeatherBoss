//
//  WeatherDetailsPresenter.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

protocol WeatherDetailsPresenting: AnyObject {
    /// Called when view did become ready
    func viewDidBecomeReady()
}

final class WeatherDetailsPresenter: WeatherDetailsPresenting {
    /// The front-facing view that conforms to the `WeatherDetailsDisplay` protocol
    weak var display: WeatherDetailsDisplay?

    /// The weather model it represents to show details
    var sceneModel: CityWeather?

    /// The data tranforming helper
    private let tranformer = WeatherDetailsTransformer()

    // MARK: - WeatherListPresenting

    func viewDidBecomeReady() {
        guard let weather = sceneModel else { return }

        display?.setTitle(weather.cityName)

        display?.setViewDetails(withPresenetationItem: tranformer.transform(input: weather))
    }
}
