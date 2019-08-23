//
//  DomainMapping.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation

/// `DomainMapping` conforming instances are responsible for mapping from a
/// lower level `Data` model to a business/usecase level `Domain` model
protocol DomainMapping {
    
    associatedtype DomainObject
    associatedtype DataObject
    
    /// Will map the given data object to the defined domain object output
    ///
    /// - Parameter dataObject: The data object to map
    /// - Returns: The mapped domain object
    func mapToDomain(_ dataObject: DataObject) -> DomainObject
}
