//
//  WeatherListPresenter.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import RxSwift

final class WeatherListPresenter: WeatherListPresenting {
    
    /// The front-facing view that conforms to the `WeatherListDisplay` protocol
    weak var display: WeatherListDisplay?
    
    // MARK: - Private Properties
    
    /// The service to fetch weather data of cities
    private let service = WeatherService()
    
    /// The data tranforming helper
    private let tranformer = WeatherListTransformer()
    
    /// The RxSwift disposing swift
    private let disposeBag = DisposeBag()
    
    
    // MARK: - WeatherListPresenting
    
    func viewDidBecomeReady() {
        
        // TODO: Load from String keys / localized file
        display?.setTitle("Current Weather")
    }
    
    func loadCurrentWeatherOfCities() {
        
        service.getCurrentWeather(forCities: Constant.CityList)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] result in
                
                self?.handleUpdatingDataSource(result)
            }, onError: { error in
                print(error)
                // TODO: handle error state on UI
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Private Helpers
    
    private func handleUpdatingDataSource(_ input: [CityWeather]) {
        let dataSource = tranformer.transform(input: input)
        display?.setWeatherListDataSource(dataSource)
    }
}
