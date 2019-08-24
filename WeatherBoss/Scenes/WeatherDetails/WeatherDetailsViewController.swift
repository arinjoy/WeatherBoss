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
    
    private let presenter: WeatherDetailsPresenter = WeatherDetailsPresenter()
    
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
        view.backgroundColor = .white

        presenter.display = self
        presenter.sceneModel = sceneModel
        
        buildUIAndApplyConstraints()
        
        presenter.viewDidBecomeReady()
    }
    
    // MARK: - Private Helpers
    
    private func buildUIAndApplyConstraints() {
        detailsView = WeatherDetailView()
        view.addSubview(detailsView)
        
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
        }
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

