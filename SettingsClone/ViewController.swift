//
//  ViewController.swift
//  SettingsClone
//
//  Created by haewon on 2024/02/03.
//  

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        
        settingsTableView.register(
            UINib(nibName: "ProfileCell", bundle: nil),
            forCellReuseIdentifier: "ProfileCell"
        )
        settingsTableView.register(
            UINib(nibName: "MenuCell", bundle: nil),
            forCellReuseIdentifier: "MenuCell"
        )
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        return 60
    }
}
