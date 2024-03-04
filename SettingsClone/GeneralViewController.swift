//
//  GeneralViewController.swift
//  SettingsClone
//
//  Created by haewon on 2024/03/04.
//

import UIKit

struct GeneralModel {
    var menuTitle = ""
}

class GeneralCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var rightImageView: UIImageView! {
        didSet {
            rightImageView.image = UIImage(systemName: "chevron.right")
        }
    }
}

class GeneralViewController: UIViewController {
    
    var generalModel = [[GeneralModel]]()

    @IBOutlet var generalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generalTableView.delegate = self
        generalTableView.dataSource = self
        generalTableView.backgroundColor = .systemGray6
        
        self.title = "General"
        self.view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.prefersLargeTitles = false
        makeData()
    }
    
    func makeData() {
        generalModel.append(
            [GeneralModel(menuTitle: "About")]
        )
        
        generalModel.append(
            [GeneralModel(menuTitle: "Keyboard"),
            GeneralModel(menuTitle: "Game Controller"),
            GeneralModel(menuTitle: "Fonts"),
            GeneralModel(menuTitle: "Language & Region"),
            GeneralModel(menuTitle: "Dictionary")]
        )
        
        generalModel.append(
            [GeneralModel(menuTitle: "Transfer or Reset iPhone")]
        )
    }
}

extension GeneralViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generalModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generalModel[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        cell.titleLabel.text = generalModel[indexPath.section][indexPath.row].menuTitle
        
        return cell
    }
    
    
}
