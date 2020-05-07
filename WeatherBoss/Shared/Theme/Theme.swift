//
//  Theme.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

enum Theme: Int {
    /// A standard Apple style light theme with teal as tint
    case light

    /// A custom brown/orangish darker theme orange as tint
    case dark

    static var current: Theme {
        return ThemeManager.currentAppTheme()
    }

    // MARK: - Colors

    var tintColor: UIColor {
        switch self {
        case .light:
            return UIColor.colorFrom(red: 58, green: 141, blue: 123) // light teal
        case .dark:
            return UIColor.colorFrom(red: 234, green: 109, blue: 87) // dark orange
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .light:
            return .white
        case .dark:
            return UIColor.colorFrom(red: 97, green: 84, blue: 82) // light orangish gray
        }
    }

    var darkerBackgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor.colorFrom(red: 226, green: 232, blue: 230) // light tealish gray
        case .dark:
            return UIColor.colorFrom(red: 70, green: 58, blue: 56) // dark orangish gray
        }
    }

    var titleTextColor: UIColor {
        switch self {
        case .light:
            return .darkText
        case .dark:
            return UIColor.colorFrom(red: 246, green: 242, blue: 241)
        }
    }

    var subtitleTextColor: UIColor {
        switch self {
        case .light:
            return .darkGray
        case .dark:
            return UIColor.colorFrom(red: 234, green: 224, blue: 224)
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

private extension UIColor {
    static func colorFrom(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
    }
}
