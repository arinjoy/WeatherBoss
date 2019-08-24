//
//  WeatherDetailView.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import SnapKit

final class WeatherDetailView: UIView {
    
    // MARK: - UI properties
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.textAlignment = .left
        return label
    }()
    
    private let mainTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    private let minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .right
        return label
    }()
    
    private let maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .right
        return label
    }()
    
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .right
        return label
    }()
    
    private let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .right
        return label
    }()
    
    private let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildUIAndApplyConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Helpers
    
    private func buildUIAndApplyConstraints() {
        let stackview = UIStackView(arrangedSubviews: [cityLabel, mainTemperatureLabel])
        
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        
        addSubview(stackview)
        
        stackview.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(25)
            make.trailing.equalTo(self.snp.trailing).offset(-25)
            make.top.equalTo(self.snp.top).offset(25)
            make.bottom.equalTo(self.snp.bottom).offset(25)
        }
    }
}

// MARK: - Configuration

extension WeatherDetailView {
    
    func configure(withPresentationItem item: WeatherDetailsPresentationItem) {
        cityLabel.text = item.cityName
        mainTemperatureLabel.text = item.temperature
        minTemperatureLabel.text = item.minTemperature
        maxTemperatureLabel.text = item.maxTemperature
        windSpeedLabel.text = item.windSpeed
        humidityLabel.text = item.humidity
        shortDescriptionLabel.text = item.shortDescription
    }
}
