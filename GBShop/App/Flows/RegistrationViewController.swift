//
//  RegistrationViewController.swift
//  GBShop
//
//  Created by Анастасия Живаева on 19.10.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var creditCardTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func registeredActionButton(_ sender: UIButton) {
        if loginTextField.text != "",
           passwordTextField.text != "",
           emailTextField.text != "",
           creditCardTextField.text != "",
           lastNameTextField.text != "",
           nameTextField.text != "" {
            let newUser = User(id: ((UserStorage.shared.users.last?.id ?? 0) + 1), login: loginTextField.text!, name: nameTextField.text!, lastname: lastNameTextField.text!)
            UserStorage.shared.addUser(user: newUser)
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let userViewController = storyBoard.instantiateViewController(withIdentifier: "UserViewController")
            navigationController?.pushViewController(userViewController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
