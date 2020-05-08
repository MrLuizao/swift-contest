//
//  TableViewController.swift
//  contest
//
//  Created by LKY on 21/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableApiList: UITableView!
    
    var dataPhoto = [String]()
    var dataName = [String]()
    var dataLast = [String]()
    var dataMail = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        title = "Lista de Usuarios"
        getData()
    }
    
    func getData(){
        
        let apiurl = "https://reqres.in/api/users"
        
        Alamofire.request(apiurl, method: .get).responseJSON { (resp) in
            switch resp.result{
                
            case .success:

                let items = try? JSON(data: resp.data!)

                let resultArray = items!["data"]

                for i in resultArray.arrayValue{

                    let photo = i["avatar"].stringValue
                    self.dataPhoto.append(photo)
                    
                    let name = i["first_name"].stringValue
                    self.dataName.append(name)
                    
                    let last = i["last_name"].stringValue
                    self.dataLast.append(last)
                    
                    let mail = i["email"].stringValue
                    self.dataMail.append(mail)
                }

                self.tableApiList.reloadData()
                break
                
            case .failure:
                print(resp.error!)
                break
                
            }

        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.labelCell.text! = dataName[indexPath.row]
        cell.accessoryType = .disclosureIndicator //Indicador de acciòn al final de la fila
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selecccionada: (indexPath.row)")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailCtrl = storyBoard.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        
        detailCtrl.avatar = dataPhoto[indexPath.row]
        detailCtrl.first_name = dataName[indexPath.row]
        detailCtrl.last_name = dataLast[indexPath.row]
        detailCtrl.email = dataMail[indexPath.row]
        
        self.navigationController?.pushViewController(detailCtrl, animated: true)

    }
    @IBAction func closeSessionBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}



