//
//  UserViewController.swift
//  GBShop
//
//  Created by Анастасия Живаева on 19.10.2021.
//

import UIKit

class UserViewController: UITableViewController {
    
    var user = User(id: 0, login: "", name: "", lastname: "")
    let users = UserStorage.shared.users
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: UserCell.reuseID)
        
        if !users.isEmpty {
            user = users.last!
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseID, for: indexPath) as! UserCell
        switch indexPath.row {
        case 0:
            cell.propertyLabel.text = "id"
            cell.valueLabel.text = String(user.id)
        case 1:
            cell.propertyLabel.text = "логин"
            cell.valueLabel.text = user.login
        case 2:
            cell.propertyLabel.text = "имя"
            cell.valueLabel.text = user.name
        case 3:
            cell.propertyLabel.text = "фамилия"
            cell.valueLabel.text = user.lastname
        default:
            break
        }
        return cell
    }
    
    
    
    
}
