//
//  CityWeatherResult.swift
//  WeatherBoss
//
//  Created by Nischal Hada on 8/5/20.
//  Copyright © 2020 ArinAppy. All rights reserved.
//

import Foundation

// MARK: - CityWeatherResult

struct CityWeatherResult: Codable {
    let cnt: Int
    let list: [WeatherList]
}

// MARK: - List

struct WeatherList: Codable {
    let coord: Coord
    let sys: Sys
    let weather: [Weather]
    let main: Main
    let visibility: Int?
    let wind: Wind
    let clouds: Clouds
    let dt, id: Int
    let name: String
}

// MARK: - Coord

struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Sys

struct Sys: Codable {
    let country: String
    let timezone, sunrise, sunset: Int
}

// MARK: - Weather

struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Main

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Double
}

// MARK: - Wind

struct Wind: Codable {
    let speed: Double
    let deg: Int
}

// MARK: - Clouds

struct Clouds: Codable {
    let all: Int
}
