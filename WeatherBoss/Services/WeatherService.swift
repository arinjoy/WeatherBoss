//
//  WeatherService.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Alamofire
import ObjectMapper
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
        return Observable.create { [weak self] observer -> Disposable in
            self?.apiClient.fetchWeatherForCitiesRequest(forCityIds: cityIds)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:

                    guard let responseJSON = response.result.value as? [String: AnyObject],
                        let weatherListJSONArray = responseJSON["list"] as? [[String: AnyObject]]
                    else {
                        observer.onError(WeatherFetchingError.dataConversion)
                        return
                    }

                    let weatherList: [CityWeather] = Mapper<CityWeatherData>()
                        .mapArray(JSONArray: weatherListJSONArray)
                        .compactMap(CityWeatherMapping().mapToDomain)

                    observer.onNext(weatherList)

                case let .failure(error):
                    if let statusCode = response.response?.statusCode,
                        let expectedServerError = WeatherFetchingError(rawValue: statusCode) {
                        observer.onError(expectedServerError)
                    } else {
                        observer.onError(error)
                    }
                }
            }
            return Disposables.create()
        }
    }
}
