//
//  WeatherSummaryCell.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import SnapKit
import UIKit

final class WeatherSummaryCell: UITableViewCell {
    // MARK: - UI Element Properties

    private let containerCardView: UIView = {
        let view = UIView()
        return view
    }()

    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        return label
    }()

    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .right
        return label
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = UITableViewCell.SelectionStyle.none
        buildUIAndApplyConstraints()
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
        Shadow(color: Theme.current.titleTextColor,
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

        // Note: Ideally colors can be passed via presentation items or view models
        // Or even text string, font & colour can be combined as NSAttributed string
        cityNameLabel.textColor = Theme.current.titleTextColor
        temperatureLabel.textColor = Theme.current.subtitleTextColor

        containerCardView.backgroundColor = Theme.current.backgroundColor
        contentView.backgroundColor = Theme.current.darkerBackgroundColor
        applyContainerStyle()

        contentView.isAccessibilityElement = true
        item.accessibility?.apply(to: contentView)
    }
}
