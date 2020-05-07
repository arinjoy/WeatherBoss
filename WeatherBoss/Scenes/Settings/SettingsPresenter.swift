//
//  SettingsPreseneter.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 25/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

protocol SettingsPresenting: AnyObject {
    /// Called when view did become ready
    func viewDidBecomeReady()
}

final class SettingsPresenter: SettingsPresenting {
    /// The front-facing view that conforms to the `SettingsDisplay` protocol
    weak var display: SettingsDisplay?

    // MARK: - SettingsPresenting

    func viewDidBecomeReady() {
        display?.setTitle(StringKeys.WeatherApp.settingsTabName.localized())

        let dataSource = buildSettingsDataSource()
        display?.setSettingsDataSource(dataSource)
    }

    // MARK: - Private Helpers

    private func buildSettingsDataSource() -> SettingsDataSource {
        let isCurrentyInDarkTheme = Theme.current == .dark
        let themeChangeItem = SettingsCellPresentationItem(
            title: StringKeys.WeatherApp.settingsDarkMode.localized(),
            showSwitchControl: true,
            isSwitchOn: isCurrentyInDarkTheme,
            switchAction: themeChangeSwitchAction()
        )
        let displayAppearenceSection = DataSection<SettingsCellPresentationItem>(
            items: [themeChangeItem],
            headerTitle: StringKeys.WeatherApp.settingsAppearenceHeading.localized()
        )

        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let appVersionItem = SettingsCellPresentationItem(
            title: StringKeys.WeatherApp.settingsVersion.localized(),
            subtitle: appVersion
        )
        let appInfoSection = DataSection<SettingsCellPresentationItem>(
            items: [appVersionItem],
            headerTitle: StringKeys.WeatherApp.settingsAppInfoHeading.localized()
        )

        return DataSource<DataSection<SettingsCellPresentationItem>>(
            sections: [displayAppearenceSection,
                       appInfoSection]
        )
    }

    /// Returns a closure that executes the relevant theme change action based on the ON/OFF state of a switch control
    private func themeChangeSwitchAction() -> SwitchAction {
        return { [weak self] (isOn: Bool) in

            // Communicate with underlying Theme engine manager to toggle theme state
            ThemeManager.applyTheme(isOn ? .dark : .light)

            // Asks the display to take immediate UI re-rendering tasks
            self?.display?.reloadUIAfterThemeChange()
        }
    }
}
