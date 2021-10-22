//
//  AuthViewController.swift
//  GBShop
//
//  Created by Анастасия Живаева on 27.09.2021.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let requestFactory = RequestFactory()
    
    @IBAction func logInButton(_ sender: UIButton) {
        guard loginTextField.text == "1", passwordTextField.text == "1" else { return }
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userViewController = storyBoard.instantiateViewController(withIdentifier: "UserViewController")
        navigationController?.pushViewController(userViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auth()
    }
    
    func auth() {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                UserStorage.shared.addUser(user: login.user)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

