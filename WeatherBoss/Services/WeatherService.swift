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

final class WeatherService {
    
    private enum Constant {
        static let serverPath: String = "https://api.openweathermap.org/data/2.5/group"
        static let apiKey: String = "a90804ee877a7f99ffe80dbbfd23695c"
        static let weatherUnit: String = "metric"
    }
    
    private var manager: SessionManager
    
    init() {
        self.manager = Alamofire.SessionManager.default
    }
    
    
    func getCurrentWeather(forCities cities: [String: String]) -> Observable<[CityWeather]> {
        
        return Observable.create { [weak self] observer -> Disposable in
            self?.manager.request(
                Constant.serverPath,
                method: HTTPMethod.get,
                parameters: self?.buildQueryParams(fromCities: cities) ?? [:]
            )
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    
                    //to get JSON return value
                    guard let responseJSON = response.result.value as? [String: AnyObject],
                        let weatherListJSONArray = responseJSON["list"] as? Array<[String: AnyObject]> else {
                            observer.onError(WeatherFetchingError.dataConversion)
                            return
                    }
                    
                    let weatherList: [CityWeather] = Mapper<CityWeatherData>()
                        .mapArray(JSONArray: weatherListJSONArray)
                        .map(CityWeatherMapping().mapToDomain)
                        .compactMap{ $0 }
                    
                    observer.onNext(weatherList)
                    
                case .failure(let error):
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
    
    // MARK: - Private Helpers
    
    private func buildQueryParams(fromCities cities: [String: String]) -> Parameters {
        var cityIdList: [String] = []
        for (_, item) in cities.enumerated() {
            cityIdList.append(item.key)
        }
        
        return [
            "id": cityIdList.joined(separator: ","),
            "units": Constant.weatherUnit,
            "APPID": Constant.apiKey
        ]
    }
}
