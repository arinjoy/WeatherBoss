//
//  WeatherListRouter.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

protocol WeatherListRouting: class {
    
    /// Will route to the weather details scene
    ///
    /// - Parameter sceneModel: The scene model that is being passed from list to details scene
    func routeToWeatherDetails(withSceneModel sceneModel: CityWeather)
}

final class WeatherListRouter: WeatherListRouting {
    
    // MARK: - Injectables
    
    weak var sourceViewController: UIViewController?
    
    init(sourceViewController: UIViewController?) {
        self.sourceViewController = sourceViewController
    }
    
    func routeToWeatherDetails(withSceneModel sceneModel: CityWeather) {
        let detailsViewController = WeatherDetailsViewController(sceneModel: sceneModel)
        sourceViewController?.show(detailsViewController, sender: nil)
    }
}
