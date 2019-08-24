//
//  SettingsCell.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import SnapKit

final class SettingsCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var switchAction: SwitchAction?

    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
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
        self.textLabel?.text = item.title
        self.detailTextLabel?.text = item.subtitle
        self.imageView?.image = item.icon
        
        if item.showSwitchControl {
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: false)
            switchView.addTarget(self, action: #selector(self.switchChanged), for: .valueChanged)
            self.accessoryView = switchView
            
            self.switchAction = item.switchAction
        }
    }
}

