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
        
        let isCurrentyInDarkTheme = ThemeManager.currentAppTheme() == .dark
        
        let themeChangeItem = SettingsCellPresentationItem(
            title: "Dark mode",
            showSwitchControl: true,
            isSwitchOn: isCurrentyInDarkTheme,
            switchAction: themeChangeSwitchAction())
        let displayAppearenceSection = DataSection<SettingsCellPresentationItem>(items: [themeChangeItem],
                                                                                 headerTitle: "Appearance")
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let appVersionItem = SettingsCellPresentationItem(
            title: "Version",
            subtitle: appVersion)
        let appInfoSection = DataSection<SettingsCellPresentationItem>(items: [appVersionItem],
                                                                       headerTitle: "App Info")
        
        return DataSource<DataSection<SettingsCellPresentationItem>>(sections: [displayAppearenceSection,
                                                                                appInfoSection])
    }
    
    /// A closure that executes the action, it takes the ON/OFF state of a switch control and returns nothing.
    private func themeChangeSwitchAction() -> SwitchAction {
        return { (isOn: Bool) in
            ThemeManager.applyTheme(isOn ? .dark : .light)
        }
    }
}
