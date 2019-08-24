//
//  WeatherListViewController.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import PKHUD

final class WeatherListViewController: UIViewController {
    
    // MARK: - View Properties
    
    private var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Private Properties
    
    private let presenter: WeatherListPresenting = WeatherListPresenter()
    
    /// The table view's data source
    private var dataSource: WeatherListDataSource = WeatherListDataSource()
    

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        (presenter as? WeatherListPresenter)?.display = self

        configureTableView()
        presenter.viewDidBecomeReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.loadCurrentWeatherOfCities()
    }
    
    // MARK: - Private Helpers
    
    @objc private func refreshWeatherData() {
        presenter.loadCurrentWeatherOfCities()
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .white
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshWeatherData), for: .valueChanged)
    }
    
}

// MARK: - WeatherListDisplay

extension WeatherListViewController: WeatherListDisplay {
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setWeatherListDataSource(_ dataSource: WeatherListDataSource) {
        self.dataSource = dataSource
        tableView.reloadData()
    }
    
    func showLoadingIndicator() {
        HUD.show(HUDContentType.progress)
    }
    
    func hideLoadingIndicator() {
        HUD.hide()
        refreshControl.endRefreshing()
    }
    
    func showError(title: String, message: String, dismissTitle: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(
            UIAlertAction(title: dismissTitle, style: .cancel))
        
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension WeatherListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfItems(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TODO: use custom cells
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CityWeatherSumaryCell")
        
        if let item = dataSource.item(atIndexPath: indexPath) {
            cell.textLabel?.text = item.cityName
            cell.detailTextLabel?.text = item.currentTemperature
        }
        return cell
    }
}

