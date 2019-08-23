//
//  CityWeatherListViewController.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

final class CityWeatherListViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: This will move to presenter. Just used for testing now
        let service = WeatherService()
        
        service.getCurrentWeather(forCities: CityList.items)
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { result in
            print(result)
         }, onError: { error in
            print(error)
        })
        .disposed(by: disposeBag)
    }
}

