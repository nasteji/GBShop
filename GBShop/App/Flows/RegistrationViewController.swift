//
//  RegistrationViewController.swift
//  GBShop
//
//  Created by Анастасия Живаева on 19.10.2021.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    let requestFactory = RequestFactory()
    
    @IBAction func registeredActionButton(_ sender: UIButton) {
        if loginTextField.text != "",
           passwordTextField.text != "",
           lastNameTextField.text != "",
           nameTextField.text != "" {
            let newUser = User(id: 1, login: loginTextField.text!, password: passwordTextField.text!, name: nameTextField.text!, lastname: lastNameTextField.text!)
            UserStorage.shared.addUser(user: newUser)
            
            Analytics.logEvent("registration", parameters: ["success": true])
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController")
            navigationController?.pushViewController(tabBarViewController, animated: true)
        } else {
            Analytics.logEvent("registration", parameters: ["success": false])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
