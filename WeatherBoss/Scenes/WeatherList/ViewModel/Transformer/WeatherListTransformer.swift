//
//  WeatherListTransformer.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

struct WeatherListTransformer: DataTransforming {
    
    func transform(input: [CityWeather]) -> WeatherListDataSource {
        
        // TODO: apply logic here for degree symbol and number formatter up to two digits
        
        let presentationItems = input.map { item  in
            WeatherSummaryPresentationItem(
                cityName: item.cityName,
                currentTemperature: "\(item.temperature)" + " degee Celcius")
        }
        
        let dataSections = [DataSection<WeatherSummaryPresentationItem>(items: presentationItems)]
        return DataSource<DataSection<WeatherSummaryPresentationItem>>(sections: dataSections)
    }
}
