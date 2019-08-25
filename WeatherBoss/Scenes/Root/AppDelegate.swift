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
        window?.backgroundColor = .white
        
        let tabBarController = UITabBarController()
        
        weatherListTabNavigationController = UINavigationController(rootViewController: WeatherListViewController())
        settingsTabNavigationControlller = UINavigationController(rootViewController: SettingsViewController())
        
        weatherListTabNavigationController?.tabBarItem = UITabBarItem(
            title: "Weather",
            image: UIImage(named: "weather-icon"),
            selectedImage: UIImage(named: "weather-icon-filled")
        )
        
        // TODO: change to Settings icon later. For now use system's `More`
        settingsTabNavigationControlller?.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.more, tag: 1)
        
        tabBarController.viewControllers = [weatherListTabNavigationController, settingsTabNavigationControlller] as? [UIViewController]
        
        customiseAppTheme()
        
        self.window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    // MARK: - Private Helpers
    
    private func customiseAppTheme() {
        ThemeManager.applyTheme(ThemeManager.currentAppTheme())
    }
}

