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
        auth()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func auth() {
        let auth = requestFactory.makeAuthRequestFatory()
        guard let login = loginTextField.text, let password = passwordTextField.text
        else { return }
        auth.login(userName: login, password: password) { response in
            switch response.result {
            case .success(let user):
                UserStorage.shared.addUser(user: User(id: user.user.id, login: user.user.login, password: password, name: user.user.name, lastname: user.user.lastname))
                DispatchQueue.main.async {
                    self.pushToTabBarViewController()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func pushToTabBarViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController")
        navigationController?.pushViewController(tabBarViewController, animated: true)
    }

}

