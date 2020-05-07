//
//  AppDelegate.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private var weatherListTabNavigationController: UINavigationController?
    private var settingsTabNavigationControlller: UINavigationController?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = Theme.current.backgroundColor

        let tabBarController = UITabBarController()

        weatherListTabNavigationController = UINavigationController(rootViewController: WeatherListViewController())
        settingsTabNavigationControlller = UINavigationController(rootViewController: SettingsViewController())

        weatherListTabNavigationController?.tabBarItem = UITabBarItem(
            title: StringKeys.WeatherApp.homeTabName.localized(),
            image: Theme.Icon.weather.icon,
            selectedImage: Theme.Icon.weatherFilled.icon
        )

        settingsTabNavigationControlller?.tabBarItem = UITabBarItem(
            title: StringKeys.WeatherApp.settingsTabName.localized(),
            image: Theme.Icon.settings.icon,
            selectedImage: Theme.Icon.settingsFilled.icon
        )

        tabBarController.viewControllers = [weatherListTabNavigationController,
                                            settingsTabNavigationControlller] as? [UIViewController]

        ThemeManager.applyTheme(Theme.current)

        self.window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }
}
