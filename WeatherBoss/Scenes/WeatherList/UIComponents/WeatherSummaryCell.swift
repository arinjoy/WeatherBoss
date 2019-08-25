//
//  WeatherSummaryCell.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import SnapKit

final class WeatherSummaryCell: UITableViewCell {
    
    // MARK: - UI Element Properties
    
    private let containerCardView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeManager.currentAppTheme().backgroundColor
        return view
    }()
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ThemeManager.currentAppTheme().titleTextColor
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = ThemeManager.currentAppTheme().subtitleTextColor
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        contentView.backgroundColor = ThemeManager.currentAppTheme().secondaryBackgroundColor
        buildUIAndApplyConstraints()
        applyContainerStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Helpers
    
    private func buildUIAndApplyConstraints() {
        
        contentView.addSubview(containerCardView)
        containerCardView.addSubview(cityNameLabel)
        containerCardView.addSubview(temperatureLabel)
        
        containerCardView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
        
        cityNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(containerCardView.snp.leading).offset(20)
            make.top.equalTo(containerCardView.snp.top).offset(16)
            make.bottom.equalTo(containerCardView.snp.bottom).offset(-16)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.trailing.equalTo(containerCardView.snp.trailing).offset(-20)
            make.top.equalTo(containerCardView.snp.top).offset(16)
            make.bottom.equalTo(containerCardView.snp.bottom).offset(-16)
        }
    }
    
    private func applyContainerStyle() {
        Shadow(color: ThemeManager.currentAppTheme().titleTextColor,
               opacity: 0.3, blur: 4,
               offset: CGSize(width: 0, height: 2))
            .apply(toView: containerCardView)
        containerCardView.layer.cornerRadius = 8.0
    }
}

// MARK: - Configuration

extension WeatherSummaryCell {
    
    func configure(withPresentationItem item: WeatherSummaryPresentationItem) {
        cityNameLabel.text = item.cityName
        temperatureLabel.text = item.currentTemperature
    }
}
