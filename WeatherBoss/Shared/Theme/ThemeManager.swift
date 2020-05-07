//
//  ThemeManager.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation
import PKHUD
import UIKit

/// A singleton type of manager that handles the theme maintenance
final class ThemeManager {
    /// The key for saving the theme in UserDefaults
    private static let AppThemeKey = "AppThemeKey"

    static func currentAppTheme() -> Theme {
        guard let storedAppThemeId = (UserDefaults.standard.value(forKey: AppThemeKey) as AnyObject).integerValue,
           let currentTheme = Theme(rawValue: storedAppThemeId)
        else {
            return .light
        }
        return currentTheme
    }

    static func applyTheme(_ theme: Theme) {
        UserDefaults.standard.setValue(theme.rawValue, forKey: AppThemeKey)
        UserDefaults.standard.synchronize()

        let sharedApplication = UIApplication.shared

        sharedApplication.delegate?.window??.tintColor = theme.tintColor
        UINavigationBar.appearance().barStyle = theme.barStyle
        UITabBar.appearance().barStyle = theme.barStyle

        UISwitch.appearance().thumbTintColor = theme.tintColor
        UISwitch.appearance().onTintColor = theme.darkerBackgroundColor
    }
}
