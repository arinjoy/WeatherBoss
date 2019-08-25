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
    
    private let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let temperatureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    private let minTemperatureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let minTemperaturePrefixLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.text = "Min"
        return label
    }()
    
    private let minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    private let maxTemperatureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let maxTemperaturePrefixLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.text = "Max"
        return label
    }()
    
    private let maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    private let humidityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let humidityPrefixLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.text = "Humidity"
        return label
    }()
    
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    private let windSpeedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let windSpeedPrefixLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.text = "Wind speed"
        return label
    }()
    
    private let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
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
        let topStackView = UIStackView(arrangedSubviews: [shortDescriptionLabel])
        topStackView.axis = .vertical
        topStackView.alignment = .leading
        topStackView.distribution = .fill
        topStackView.spacing = 10
        
        let mainTemperatureStackView = UIStackView(arrangedSubviews: [temperatureIcon,
                                                                      temperatureLabel])
        mainTemperatureStackView.axis = .horizontal
        mainTemperatureStackView.spacing = 20
        
        let minTemperatureStackView = UIStackView(arrangedSubviews: [minTemperatureIcon,
                                                                     minTemperaturePrefixLabel,
                                                                     minTemperatureLabel])
        minTemperatureStackView.axis = .horizontal
        minTemperatureStackView.spacing = 20
        
        let maxTemperatureStackView = UIStackView(arrangedSubviews: [maxTemperatureIcon,
                                                                     maxTemperaturePrefixLabel,
                                                                     maxTemperatureLabel])
        maxTemperatureStackView.axis = .horizontal
        maxTemperatureStackView.spacing = 20
        
        let humidityStackView = UIStackView(arrangedSubviews: [humidityIcon,
                                                               humidityPrefixLabel,
                                                               humidityLabel])
        humidityStackView.axis = .horizontal
        humidityStackView.spacing = 20
        
        let windSpeedStackView = UIStackView(arrangedSubviews: [windSpeedIcon,
                                                                windSpeedPrefixLabel,
                                                                windSpeedLabel])
        windSpeedStackView.axis = .horizontal
        windSpeedStackView.spacing = 20
        
        let padderView = UIView()
        
        let bottomStackView = UIStackView(arrangedSubviews: [mainTemperatureStackView,
                                                             minTemperatureStackView,
                                                             maxTemperatureStackView,
                                                             padderView,
                                                             humidityStackView,
                                                             windSpeedStackView])
        bottomStackView.axis = .vertical
        bottomStackView.alignment = .trailing
        bottomStackView.distribution = .fill
        bottomStackView.spacing = 20
        
        let wrapperStackView = UIStackView(arrangedSubviews: [topStackView,
                                                              bottomStackView])
        wrapperStackView.axis = .vertical
        wrapperStackView.distribution = .fill
        wrapperStackView.alignment = .fill
        wrapperStackView.spacing = 20
        addSubview(wrapperStackView)
        
        padderView.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.width.equalTo(1)
        }
        
        temperatureIcon.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        for imageView in [minTemperatureIcon,
                          maxTemperatureIcon,
                          humidityIcon,
                          windSpeedIcon] {
            imageView.snp.makeConstraints { make in
                make.width.equalTo(35)
                make.height.equalTo(35)
            }
        }
        
        wrapperStackView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(10)
        }
    }
}

// MARK: - Configuration

extension WeatherDetailView {
    
    func configure(withPresentationItem item: WeatherDetailsPresentationItem) {
        
        shortDescriptionLabel.text = item.shortDescription
        
        temperatureLabel.text = item.temperature
        temperatureIcon.image = item.temperatureIcon?.withRenderingMode(.alwaysTemplate)
        
        minTemperatureLabel.text = item.minTemperature
        minTemperatureIcon.image = item.minTemperatureIcon?.withRenderingMode(.alwaysTemplate)
        
        maxTemperatureLabel.text = item.maxTemperature
        maxTemperatureIcon.image = item.maxTemperatureIcon?.withRenderingMode(.alwaysTemplate)
        
        humidityLabel.text = item.humidity
        humidityIcon.image = item.humidityIcon?.withRenderingMode(.alwaysTemplate)
        
        windSpeedLabel.text = item.windSpeed
        windSpeedIcon.image = item.windSpeedIcon?.withRenderingMode(.alwaysTemplate)
        
        applyLatestThemeColor()
    }
    
    func applyLatestThemeColor() {
        self.backgroundColor = Theme.current.backgroundColor
        
        shortDescriptionLabel.textColor = Theme.current.subtitleTextColor
        
        temperatureLabel.textColor = Theme.current.titleTextColor
        
        minTemperaturePrefixLabel.textColor = Theme.current.subtitleTextColor
        minTemperatureLabel.textColor = Theme.current.titleTextColor
        
        maxTemperaturePrefixLabel.textColor = Theme.current.subtitleTextColor
        maxTemperatureLabel.textColor = Theme.current.titleTextColor
        
        humidityPrefixLabel.textColor = Theme.current.subtitleTextColor
        humidityLabel.textColor = Theme.current.titleTextColor
        
        windSpeedPrefixLabel.textColor = Theme.current.subtitleTextColor
        windSpeedLabel.textColor = Theme.current.titleTextColor
    }
}
