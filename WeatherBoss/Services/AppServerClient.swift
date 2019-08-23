//
//  APIServiceClient.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Alamofire

final class AppServerClient {
    
    enum WeatherFetchingError: Int, Error {
        case unAuthorized = 401
        case notFound = 404
        case unknown
    }
    
    enum Constant {
        static let serverPath: String = "http://api.openweathermap.org/data/2.5/"
        static let apiKey: String = "a90804ee877a7f99ffe80dbbfd23695c"
    }
    
    
    func getWeatherForcast(forCities cities: [String: String]) -> () {}
    
}
