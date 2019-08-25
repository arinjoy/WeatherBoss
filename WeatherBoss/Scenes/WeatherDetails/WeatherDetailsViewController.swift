//
//  WeatherDetailsViewController.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import SnapKit

final class WeatherDetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    /// The scene model data to being passed along from previous context
    private var sceneModel: CityWeather
    
    /// The presenter conforming to the `WeatherDetailsPresenting`
    private var presenter: WeatherDetailsPresenting!
    
    /// The UI holding view for details
    private var detailsView: WeatherDetailView!
    
    // MARK: - Lifecycle
    
    required init(sceneModel: CityWeather) {
        self.sceneModel = sceneModel
        super.init(nibName: nil, bundle: Bundle(for: WeatherDetailsViewController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        presenter = WeatherDetailsPresenter()

        // Injecting display & scene model weakly to the presenting instance
        // Note: Can be done via 3rd party Dependency Injection framework like Swinject and syntax could be simplified
        (presenter as? WeatherDetailsPresenter)?.display = self
        (presenter as? WeatherDetailsPresenter)?.sceneModel = sceneModel
        
        buildUIAndApplyConstraints()
        applyLatestThemeStyle()
        
        presenter.viewDidBecomeReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        applyLatestThemeStyle()
        presenter.viewDidBecomeReady()
    }
    
    // MARK: - Private Helpers
    
    private func buildUIAndApplyConstraints() {
        detailsView = WeatherDetailView()
        view.addSubview(detailsView)
        
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(120)
            make.leading.equalTo(view.snp.leading).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(-15)
        }
    }
    
    private func applyLatestThemeStyle() {
        navigationController?.navigationBar.barStyle = Theme.current.barStyle
        navigationController?.tabBarController?.tabBar.barStyle = Theme.current.barStyle
        view.backgroundColor = Theme.current.backgroundColor
    }
}

// MARK: - WeatherDetailsDisplay

extension WeatherDetailsViewController: WeatherDetailsDisplay {
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setViewDetails(withPresenetationItem item: WeatherDetailsPresentationItem) {
        detailsView.configure(withPresentationItem: item)
    }
}

