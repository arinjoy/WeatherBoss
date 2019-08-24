//
//  WeatherListViewController.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

final class WeatherListViewController: UIViewController {
    
    // MARK: - View Properties
    private var tableView: UITableView!
    
    // MARK: - Private Properties
    
    /// The table view's data source
    private var dataSource: WeatherListDataSource = WeatherListDataSource()
    
    /// The dispose bag
    private let disposeBag = DisposeBag()
    
    

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
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

// MARK: - WeatherListDisplay

extension WeatherListViewController: WeatherListDisplay {
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setWeatherListDataSource(_ dataSource: WeatherListDataSource) {
        self.dataSource = dataSource
        // TODO: reload tabe View
    }
}

// MARK: - UITableView related

extension WeatherListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cityWeatherSumaryCell")
        // TODO: use custom cells
        cell.textLabel?.text = "Melbourne"
        cell.detailTextLabel?.text = "20 degree"
        return cell
    }
}

