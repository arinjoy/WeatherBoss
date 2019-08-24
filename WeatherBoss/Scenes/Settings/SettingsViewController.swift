//
//  SettingsViewController.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 23/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    // MARK: - View Properties
    
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureTableView()
    }
    
    // MARK: - Private Helpers
    
    private func configureTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
    
    @objc private func themeChnageSwitchTapped(_ sender: UISwitch) {
        // TODO:
    }
}

// MARK: - UITableViewDataSource

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: nil)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "Dark mode"
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: false)
            switchView.tag = indexPath.row
            switchView.addTarget(self, action: #selector(self.themeChnageSwitchTapped), for: .valueChanged)
            cell.accessoryView = switchView
        } else {
            cell.textLabel?.text = "Version"
            if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                cell.detailTextLabel?.text = appVersion
            }

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Appearence"
        } else {
            return "App Info"
        }
    }
}


