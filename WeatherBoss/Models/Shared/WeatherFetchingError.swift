//
//  WeatherFetchingError.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

enum WeatherFetchingError: Int, Error {
    case invalidParameter = 400
    case unAuthorized = 401
    case notFound = 404
    case dataConversion
}
