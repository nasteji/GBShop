//
//  AuthViewController.swift
//  GBShop
//
//  Created by Анастасия Живаева on 27.09.2021.
//

import UIKit
import Firebase
import Alamofire

class AuthViewController: UIViewController, TrackableMixin {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let requestFactory = RequestFactory()
    
    @IBAction func logInButton(_ sender: UIButton) {
        auth()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.isAccessibilityElement = true
        loginTextField.accessibilityIdentifier = "login"
        passwordTextField.isAccessibilityElement = true
        passwordTextField.accessibilityIdentifier = "password"
    }
    
    func auth() {
        let auth = requestFactory.makeAuthRequestFatory()
        guard let login = loginTextField.text, let password = passwordTextField.text
        else { return }
    //    auth.login(userName: login, password: password) { response in
        auth.login(userName: "Somebody", password: "mypassword") { response in
            
            switch response.result {
            case .success(let user):
                UserStorage.shared.addUser(user: User(id: user.user.id, login: user.user.login, password: password, name: user.user.name, lastname: user.user.lastname))
                self.track(AnalyticsEvent.login(
                    method: AnalyticsEvent.LoginParams.methodDefault,
                    success: true))
                DispatchQueue.main.async {
                    self.pushToTabBarViewController()
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.track(AnalyticsEvent.login(
                    method: AnalyticsEvent.LoginParams.methodDefault,
                    success: false))
                self.assertionFailure(error.localizedDescription)
            }
        }
    }
    
    func pushToTabBarViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController")
        navigationController?.pushViewController(tabBarViewController, animated: true)
    }
        
    func assertionFailure(_ message: String) {
        #if DEBUG
        Swift.assertionFailure(message)
        #else
        self.track(AnalyticsEvent.someMethod(name: "AssertionFailure", some: message))
        #endif
    }
              
}
