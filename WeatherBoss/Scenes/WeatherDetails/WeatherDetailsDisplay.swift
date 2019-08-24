//
//  WeatherDetailsDisplay.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation

protocol WeatherDetailsDisplay: class {
    
    /// Will set the view title in navigation bar
    ///
    /// - Parameter title: The title to set
    func setTitle(_ title: String)
    
    /// Will set view details with transformed presentation items
    ///
    /// - Parameter item: The presentation item to set
    func setViewDetails(withPresenetationItem item: WeatherDetailsPresentationItem)
}
