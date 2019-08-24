//
//  SettingsPreseneter.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

protocol SettingsPresenting: class {
    
    /// Called when view did become ready
    func viewDidBecomeReady()
}

final class SettingsPresenter: SettingsPresenting {
    
    /// The front-facing view that conforms to the `SettingsDisplay` protocol
    weak var display: SettingsDisplay?
    
    
    // MARK: - SettingsPresenting
    
    func viewDidBecomeReady() {
        display?.setTitle("Settings")
        
        let dataSource = buildSettingsDataSource()
        display?.setSettingsDataSource(dataSource)
    }
    
    // MARK: - Private Helpers
    
    private func buildSettingsDataSource() -> SettingsDataSource {
        
        // TODO: check Theme Manager Settings
        let themeChangeItem = SettingsCellPresentationItem(title: "Dark mode",
                                                           showSwitchControl: true,
                                                           switchAction: nil)
        let displayAppearenceSection = DataSection<SettingsCellPresentationItem>(items: [themeChangeItem],
                                                                                 headerTitle: "Appearance")
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let appVersionItem = SettingsCellPresentationItem(title: "Version",
                                                          subtitle: appVersion)
        let appInfoSection = DataSection<SettingsCellPresentationItem>(items: [appVersionItem],
                                                                       headerTitle: "App Info")
        
        return DataSource<DataSection<SettingsCellPresentationItem>>(sections: [displayAppearenceSection,
                                                                                appInfoSection])
    }
}
