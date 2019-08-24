//
//  WeatherListPresenter.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import RxSwift

protocol WeatherListPresenting: class {
    
    /// Called when view did become ready
    func viewDidBecomeReady()
    
    /// Will load current weather status for a list of given cities
    func loadCurrentWeatherOfCities()
    
    /// Called when user taps an item form the weather list
    func didTapCityWeather(at index: Int)
}

final class WeatherListPresenter: WeatherListPresenting {
    
    /// The front-facing view that conforms to the `WeatherListDisplay` protocol
    weak var display: WeatherListDisplay?
    
    /// The routing instance for the presenter
    var router: WeatherListRouting?
    
    
    // MARK: - Private Properties
    
    /// The service to fetch weather data of cities
    private let service = WeatherService()
    
    /// List of weather data fetched
    private var weatherListData: [CityWeather]?
    
    /// The data tranforming helper
    private let tranformer = WeatherListTransformer()
    
    /// The RxSwift disposing swift
    private let disposeBag = DisposeBag()
    
    
    // MARK: - WeatherListPresenting
    
    func viewDidBecomeReady() {
        
        // TODO: Load from String keys / localized file
        display?.setTitle("Weather")
    }
    
    func loadCurrentWeatherOfCities() {
        display?.showLoadingIndicator()
        
        service.getCurrentWeather(forCities: Constant.CityList)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] result in
                self?.display?.hideLoadingIndicator()
                self?.handleUpdatingDataSource(result)
            }, onError: { [weak self] error in
        
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
                    self?.display?.hideLoadingIndicator()
                    
                    // TODO: Detect error code and customise accordingly
                    self?.display?.showError(
                        title: "Oops. Something wrong",
                        message: "There are some technical difficulties. Please try again.",
                        dismissTitle: "OK")
                })

            })
            .disposed(by: disposeBag)
    }
    
    func didTapCityWeather(at index: Int) {
        guard let weatherList = weatherListData,
            index < weatherList.count
        else { return }
        
        let weather = weatherList[index]
        router?.routeToWeatherDetails(withSceneModel: weather)
    }
    
    // MARK: - Private Helpers
    
    private func handleUpdatingDataSource(_ input: [CityWeather]) {
        // Keep reference to teh latest fetched weather data
        weatherListData = input
        
        let dataSource = tranformer.transform(input: input)
        display?.setWeatherListDataSource(dataSource)
    }
}
