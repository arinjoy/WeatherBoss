//
//  WeatherListViewController.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import PKHUD
import SnapKit

final class WeatherListViewController: UIViewController {
    
    // MARK: - View Properties
    
    private var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Private Properties
    
    /// The presenter conforming to the `WeatherListPresenting`
    private var presenter: WeatherListPresenting!
    
    /// The table view's data source
    private var dataSource: WeatherListDataSource = WeatherListDataSource()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        presenter = WeatherListPresenter()
        
        // Injecting display & router weakly to the presenting instance
        // TODO: Can be done via 3rd party Dependency Injection framework like Swinject and syntax could be simplified
        (presenter as? WeatherListPresenter)?.display = self
        (presenter as? WeatherListPresenter)?.router = WeatherListRouter(sourceViewController: self)
        
        configureTableView()
        
        applyLatestThemeStyle()
        
        presenter.viewDidBecomeReady()
        presenter.loadCurrentWeatherOfCities()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        applyLatestThemeStyle()
    }
    
    // MARK: - Private Helpers
    
    @objc private func refreshWeatherData() {
        presenter.loadCurrentWeatherOfCities()
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(tableView)
        
        tableView.register(WeatherSummaryCell.self, forCellReuseIdentifier: "WeatherSummaryCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshWeatherData), for: .valueChanged)
    }
    
    private func applyLatestThemeStyle() {
        navigationController?.navigationBar.barStyle = Theme.current.barStyle
        navigationController?.tabBarController?.tabBar.barStyle = Theme.current.barStyle
        view.backgroundColor = Theme.current.backgroundColor
        tableView.backgroundColor = Theme.current.secondaryBackgroundColor
        tableView.refreshControl?.tintColor = Theme.current.subtitleTextColor
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

extension WeatherListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfItems(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherSummaryCell") as? WeatherSummaryCell,
            let item = dataSource.item(atIndexPath: indexPath)
        else {
            return UITableViewCell()
        }

        cell.configure(withPresentationItem: item)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension WeatherListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapCityWeather(at: indexPath.row)
    }
}

