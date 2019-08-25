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
        label.text = StringKeys.WeatherApp.minTempPrefix.localized()
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
        label.text = StringKeys.WeatherApp.maxTempPrefix.localized()
        return label
    }()
    
    /// The reference to the wrapper stakc view to attach parent container accessbility
    private var currentTemperatureStackView: UIStackView = UIStackView()
    private var minTemperatureStackView: UIStackView = UIStackView()
    private var maxTemperatureStackView: UIStackView = UIStackView()
    private var humidityStackView: UIStackView = UIStackView()
    private var windSpeedStackView: UIStackView = UIStackView()
    
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
        label.text = StringKeys.WeatherApp.humidityPrefix.localized()
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
        label.text = StringKeys.WeatherApp.windSpeedPreix.localized()
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
        
        for view in [temperatureIcon, temperatureLabel] {
            currentTemperatureStackView.addArrangedSubview(view)
        }
        currentTemperatureStackView.axis = .horizontal
        currentTemperatureStackView.spacing = 20
        
        for view in [minTemperatureIcon, minTemperaturePrefixLabel, minTemperatureLabel] {
            minTemperatureStackView.addArrangedSubview(view)
        }
        minTemperatureStackView.axis = .horizontal
        minTemperatureStackView.spacing = 20
        
        for view in [maxTemperatureIcon, maxTemperaturePrefixLabel, maxTemperatureLabel] {
            maxTemperatureStackView.addArrangedSubview(view)
        }
        maxTemperatureStackView.axis = .horizontal
        maxTemperatureStackView.spacing = 20
        
        for view in [humidityIcon, humidityPrefixLabel, humidityLabel] {
            humidityStackView.addArrangedSubview(view)
        }
        humidityStackView.axis = .horizontal
        humidityStackView.spacing = 20
        
        for view in [windSpeedIcon, windSpeedPrefixLabel, windSpeedLabel] {
            windSpeedStackView.addArrangedSubview(view)
        }
        windSpeedStackView.axis = .horizontal
        windSpeedStackView.spacing = 20
        
        let padderView = UIView()
        
        let bottomStackView = UIStackView(arrangedSubviews: [currentTemperatureStackView,
                                                             minTemperatureStackView,
                                                             maxTemperatureStackView,
                                                             UIView(),
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
        temperatureIcon.image = item.temperatureIcon
        
        minTemperatureLabel.text = item.minTemperature
        minTemperatureIcon.image = item.minTemperatureIcon
        
        maxTemperatureLabel.text = item.maxTemperature
        maxTemperatureIcon.image = item.maxTemperatureIcon
        
        humidityLabel.text = item.humidity
        humidityIcon.image = item.humidityIcon
        
        windSpeedLabel.text = item.windSpeed
        windSpeedIcon.image = item.windSpeedIcon
        
        applyLatestThemeColor()
        
        applyAccessbility(item.accessibility)
    }
    
    func applyLatestThemeColor() {
        self.backgroundColor = Theme.current.backgroundColor
        
        shortDescriptionLabel.textColor = Theme.current.subtitleTextColor
        
        temperatureLabel.textColor = Theme.current.titleTextColor
        
        minTemperaturePrefixLabel.textColor = Theme.current.titleTextColor
        minTemperatureLabel.textColor = Theme.current.subtitleTextColor
        
        maxTemperaturePrefixLabel.textColor = Theme.current.titleTextColor
        maxTemperatureLabel.textColor = Theme.current.subtitleTextColor
        
        humidityPrefixLabel.textColor = Theme.current.titleTextColor
        humidityLabel.textColor = Theme.current.subtitleTextColor
        
        windSpeedPrefixLabel.textColor = Theme.current.titleTextColor
        windSpeedLabel.textColor = Theme.current.subtitleTextColor
    }
    
    private func applyAccessbility(_ accessibility: WeatherDetailsPresentationItem.Accessibility?) {
        currentTemperatureStackView.isAccessibilityElement = true
        accessibility?.currentTemperatureAccessibility.apply(to: currentTemperatureStackView)
        
        minTemperatureStackView.isAccessibilityElement = true
        accessibility?.minTemperatureAccessibility.apply(to: minTemperatureStackView)
        
        maxTemperatureStackView.isAccessibilityElement = true
        accessibility?.maxTemperatureAccessibility.apply(to: maxTemperatureStackView)
        
        humidityStackView.isAccessibilityElement = true
        accessibility?.humidityAccessibility.apply(to: humidityStackView)
        
        windSpeedStackView.isAccessibilityElement = true
        accessibility?.windSpeedAccessibility.apply(to: windSpeedStackView)
    }
}
