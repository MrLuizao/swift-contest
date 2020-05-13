//
//  CRUDViewController.swift
//  contest
//
//  Created by LKY on 12/05/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

class CRUDViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        title = "CRUD"
    }
    
    @IBAction func addUserBtn(_ sender: Any) {
        AlertService.addUser(in: self){ user in
            print(user)
        }
    }
    
    @IBAction func popNavigateBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = String(user.age)
        
        return cell
    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //AlertService.updateUser(in: self)
//    }
//    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        guard  editingStyle == .delete else {
//            return
//        }
//    }
    
}
