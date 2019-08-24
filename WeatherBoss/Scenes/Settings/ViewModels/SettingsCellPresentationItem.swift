//
//  SettingsCellPresentationItem.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation
import UIKit

/// Switch action callback with parameter indicating state of switch
typealias SwitchAction = (_ isOn: Bool) -> Void

struct SettingsCellPresentationItem {
    
    /// The optional icon image of the control.
    let icon: UIImage?
    
    /// The title of the control that indicates the type of settings on the left
    let title: String
    
    /// The optional subtitle of the settings that provides any extra information on the right
    let subtitle: String?
    
    /// Whether to show a control switch
    let showSwitchControl: Bool
    
    /// The ON/OFF state of the control toggle.
    let isSwitchOn: Bool
    
    /// The action to be performed when control toggle is changed.
    let switchAction: SwitchAction?
    
    init(
        icon: UIImage? = nil,
        title: String,
        subtitle: String? = nil,
        showSwitchControl: Bool = false,
        isSwitchOn: Bool = false,
        switchAction: SwitchAction? = nil
    ) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.showSwitchControl = showSwitchControl
        self.isSwitchOn = isSwitchOn
        self.switchAction = switchAction
    }
}
