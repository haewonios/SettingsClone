//
//  MyIDViewController.swift
//  SettingsClone
//
//  Created by haewon on 2024/03/04.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var idTextField: UITextField!
    
    @IBOutlet var forgotButton: UIButton!
    
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.addLeftPadding()
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        forgotButton.titleLabel?.textAlignment = .center
        forgotButton.addTarget(self, action: #selector(showOptions), for: .touchUpInside)
    }

    @objc
    func textFieldDidChange(sender: UITextField) {
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }

    @objc
    func showOptions() {
        let alert = UIAlertController(title: nil, message: "Forgot password or don't have an Apple ID?", preferredStyle: .alert)
        
        let forgot = UIAlertAction(title: "Forgot Password or Apple ID", style: .default)
        let create = UIAlertAction(title: "Create Apple ID", style: .default)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(forgot)
        alert.addAction(create)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}

extension UITextField {
    // 타이틀 라벨과의 패딩 추가
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
