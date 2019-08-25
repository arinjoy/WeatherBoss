//
//  DataTransforming.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation

/// `DataTransforming` conforming instances are responsible for taking an input domain model object
/// and returning a presentation/view model output type.
protocol DataTransforming {
    associatedtype Input
    associatedtype Output
    
    /// Will transform the given input into the associated output.
    ///
    /// - Parameter input: The domain model object to transform
    /// - Returns: The presentation item / view model object
    func transform(input: Input) -> Output
}

