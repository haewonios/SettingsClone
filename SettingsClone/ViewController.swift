//
//  ViewController.swift
//  SettingsClone
//
//  Created by haewon on 2024/02/03.
//  

import UIKit

class ViewController: UIViewController {
    
    var settingModel = [[SettingModel]]()
    
    @IBOutlet var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.backgroundColor = .systemGray6
        
        settingsTableView.register(
            UINib(nibName: "ProfileCell", bundle: nil),
            forCellReuseIdentifier: "ProfileCell"
        )
        settingsTableView.register(
            UINib(nibName: "MenuCell", bundle: nil),
            forCellReuseIdentifier: "MenuCell"
        )
        self.title = "Settings"
        self.view.backgroundColor = .systemGray6
        
        makeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func makeData() {
        settingModel.append(
            [SettingModel(
                leftImageName: "person.circle",
                menuTitle: "Sign in to your iPhone",
                menuDescription: "Set up iCloud, the App Store, and more.",
                rightImageName: nil
            )]
        )
        
        settingModel.append(
            [SettingModel(
                leftImageName: "hourglass",
                menuTitle: "Screen Time",
                menuDescription: nil,
                rightImageName: "chevron.right"
            )]
        )
        
        settingModel.append(
            [SettingModel(
                leftImageName: "gear",
                menuTitle: "General",
                menuDescription: nil,
                rightImageName: "chevron.right"
            ), SettingModel(
                leftImageName: "figure.yoga",
                menuTitle: "Accessibility",
                menuDescription: nil,
                rightImageName: "chevron.right"
            ), SettingModel(
                leftImageName: "hand.raised.fill",
                menuTitle: "Privacy & Security",
                menuDescription: nil,
                rightImageName: "chevron.right"
            )]
        )
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.titleLabel.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName:  settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.descriptionLabel.text = settingModel[indexPath.section][indexPath.row].menuDescription
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.leftImageView.image = UIImage(systemName:  settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.titleLabel.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 && indexPath.row == 0 {
            if let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(identifier: "GeneralViewController") as? GeneralViewController {
                self.navigationController?.pushViewController(generalVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return 60
    }
}
