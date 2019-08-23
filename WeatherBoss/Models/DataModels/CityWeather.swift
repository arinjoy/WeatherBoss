//
//  DataModels.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import ObjectMapper

class CityWeatherData: Mappable {
    
    var cityId: Int?
    var cityName: String?
    
    var shortDescription: String?
    var temperature: Double?
    var minTemperature: Double?
    var maxTemperature: Double?
    var humidity: Double?
    var windSpeed: Double?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        cityId <- map["id"]
        cityName <- map["name"]
        temperature <- map["main.temp"]
        minTemperature <- map["main.temp_min"]
        maxTemperature <- map["main.temp_max"]
        humidity <- map["main.humidity"]
        windSpeed <- map["wind.speed"]
    }
}
