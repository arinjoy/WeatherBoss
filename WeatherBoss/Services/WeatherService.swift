//
//  WeatherService.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Alamofire
import RxSwift

/// Weather Service reponsible for fething weather data
final class WeatherService {
    /// A low level Api client that provides URL request to get weather response
    private var apiClient: WeatherApiClient

    init() {
        apiClient = WeatherApiClient()
    }

    /// Fetches weather for cities and reponds via Observable

    func getCurrentWeather(forCities cityIds: [String]) -> Observable<[CityWeather]> {
        return request(forCities: cityIds)
            .map { data -> [CityWeather] in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(CityWeatherResult.self, from: data)
                let cityWeather = result.list.map { CityWeather(fromWeatherList: $0) }
                return cityWeather
            }
            .retry(2)
            .asObservable()
    }

    private func request(forCities cityIds: [String]) -> Observable<Data> {
        return Observable<Data>.create { [weak self] observer in
            self?.apiClient.fetchWeatherForCitiesRequest(forCityIds: cityIds)
                .validate()
                .responseData(completionHandler: { response in
                    switch response.result {
                    case let .success(value):
                        observer.on(.next(value))
                        observer.on(.completed)
                    case let .failure(error):
                        observer.on(.error(error))
                    }
                })
            return Disposables.create()
        }
    }
}
