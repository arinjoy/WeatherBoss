//
//  CityWeatherMapping.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

struct CityWeatherMapping: DomainMapping {
    typealias DomainObject = CityWeather?
    typealias DataObject = CityWeatherData

    func mapToDomain(_ dataObject: CityWeatherData) -> CityWeather? {
        guard let cityId = dataObject.cityId,
            let cityName = dataObject.cityName,
            let temperature = dataObject.temperature,
            let minTemperature = dataObject.minTemperature,
            let maxTemperature = dataObject.maxTemperature,
            let humidity = dataObject.humidity,
            let windSpeed = dataObject.windSpeed
        else {
            return nil
        }

        return CityWeather(
            cityId: String(cityId), // Integer to String conversion for id
            cityName: cityName,
            temperature: temperature,
            minTemperature: minTemperature,
            maxTemperature: maxTemperature,
            humidity: humidity,
            windSpeed: windSpeed,
            shortDescription: dataObject.weatherInfo?.first?.summary // This summary description may not be always present
        )
    }
}
