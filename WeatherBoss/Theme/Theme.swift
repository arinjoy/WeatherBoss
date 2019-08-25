//
//  Theme.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

enum Theme: Int {
    
    /// A standard Apple style light theme
    case light
    
    /// A custom brown/oragish darker theme
    case dark
    
    static var current: Theme {
        return ThemeManager.currentAppTheme()
    }
    
    // MARK: - Colors
    
    var tintColor: UIColor {
        switch self {
        case .light:
            return UIColor(red: 58/255.0, green: 141/255.0, blue: 123/255.0, alpha: 1.0) // light teal
        case .dark:
            return UIColor(red: 234/255.0, green: 109/255.0, blue: 87/255.0, alpha: 1.0)  // dark orange
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .light:
            return .white
        case .dark:
            return UIColor(red: 90/255.0, green: 74/255.0, blue: 71/255.0, alpha: 1.0) // orangish gray
        }
    }
    
    var secondaryBackgroundColor: UIColor {
        switch self {
        case .light:
            return .groupTableViewBackground
        case .dark:
            return UIColor(red: 103/255.0, green: 87/255.0, blue: 84/255.0, alpha: 1.0)
        }
    }
    
    var titleTextColor: UIColor {
        switch self {
        case .light:
            return .darkText
        case .dark:
            return .lightText
        }
    }
    
    var subtitleTextColor: UIColor {
        switch self {
        case .light:
            return .darkGray
        case .dark:
            return .lightGray
        }
    }
    
    // MARK: - Navigation Bar
    
    var barStyle: UIBarStyle {
        switch self {
        case .light:
            return .default
        case .dark:
            return .black
        }
    }
}
