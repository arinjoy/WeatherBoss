//
//  ApiClient.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Alamofire

/// A base class for API Client
class ApiClient {
    
    /// The Alamofire session manager
    var manager: SessionManager
    
    init() {
        let configuration = URLSessionConfiguration.default
        // Reducing standard timeout up to 10 sec
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        self.manager = Alamofire.SessionManager(configuration: configuration)
    }
}

/// A client that handles Weather API related requests
final class WeatherApiClient: ApiClient {
    
    /// Builds a GET request for fetching weather data for multiple cities
    ///
    /// - Parameter cityIds: The list of ids for the cities
    /// - Returns: `Alamofire.DataRequest`
    func fetchWeatherForCitiesRequest(forCityIds cityIds: [String]) -> Alamofire.DataRequest{
        return manager.request(
            Constant.ApiConfig.serverPath,
            method: HTTPMethod.get,
            parameters: self.buildQueryParams(withCityIds: cityIds)
        )
    }
    
    // Note: More requests can be built with other methods.
    // E.g. detailed information, hourly forecast, historical data etc. as per Open Weather Map API offerings
    
    
    // MARK: - Private Helpers
    
    private func buildQueryParams(withCityIds cityIds: [String]) -> Parameters {
        return [
            "id": cityIds.joined(separator: ","),
            "units": Constant.ApiConfig.weatherUnit,
            "APPID": Constant.ApiConfig.apiKey
        ]
    }
}



