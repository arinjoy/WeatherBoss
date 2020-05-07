//
//  SettingsCell.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import SnapKit
import UIKit

final class SettingsCell: UITableViewCell {
    // MARK: - Properties

    private var switchAction: SwitchAction?

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)

        selectionStyle = UITableViewCell.SelectionStyle.none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Action

    @objc private func switchChanged(_ sender: UISwitch) {
        switchAction?(sender.isOn)
    }
}

// MARK: - Configuration

extension SettingsCell {
    func configure(withPresentationItem item: SettingsCellPresentationItem) {
        textLabel?.text = item.title
        detailTextLabel?.text = item.subtitle
        imageView?.image = item.icon

        backgroundColor = Theme.current.backgroundColor
        textLabel?.textColor = Theme.current.titleTextColor
        detailTextLabel?.textColor = Theme.current.subtitleTextColor

        if item.showSwitchControl {
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(item.isSwitchOn, animated: true)
            switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            accessoryView = switchView

            switchAction = item.switchAction
        }
    }
}
