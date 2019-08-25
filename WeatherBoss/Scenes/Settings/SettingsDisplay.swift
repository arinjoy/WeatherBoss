//
//  SettingsDisplay.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import Foundation

typealias SettingsDataSource = DataSource<DataSection<SettingsCellPresentationItem>>

protocol SettingsDisplay: class {
    
    /// Will set the view title in navigation bar
    ///
    /// - Parameter title: The title to set
    func setTitle(_ title: String)
    
    /// Will display the given data source as the primary display set
    ///
    /// - Parameter dataSource: The set of data to display (transformed view models)
    func setSettingsDataSource(_ dataSource: SettingsDataSource)
    
    /// Will ask the display to reload UI after theme change
    func reloadUIAfterThemeChange()
}
