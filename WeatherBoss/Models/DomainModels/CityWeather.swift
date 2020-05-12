//
//  CityWeather.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

struct CityWeather {
    let cityId: String
    let cityName: String

    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let humidity: Double
    let windSpeed: Double
    let shortDescription: String?
}

extension CityWeather {
    init(fromWeatherList info: WeatherList) {
        cityId = String(info.id)
        cityName = info.name
        temperature = info.main.temp
        minTemperature = info.main.tempMin
        maxTemperature = info.main.tempMax
        humidity = info.main.humidity
        windSpeed = info.wind.speed
        shortDescription = info.weather.first?.description
    }
}
