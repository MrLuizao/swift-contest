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
    
//declaracion de los elementos y variables
    @IBOutlet weak var tableApiList: UITableView!
    
    var dataPhoto = [String]()
    var dataName = [String]()
    var dataLast = [String]()
    var dataMail = [String]()
    var pushedRow = 0
    
//se establecen los valores de la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataName[indexPath.row]
        cell.accessoryType = .disclosureIndicator //Indicador de acciòn al final de la fila
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailCtrl = storyBoard.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        
        detailCtrl.avatar = dataPhoto[indexPath.row]
        detailCtrl.first_name = dataName[indexPath.row]
        detailCtrl.last_name = dataLast[indexPath.row]
        detailCtrl.email = dataMail[indexPath.row]
        
        self.navigationController?.pushViewController(detailCtrl, animated: true)

    }
    
    override func viewDidLoad() {//inicia ciclo de vida de la vista
        super.viewDidLoad()
        
//se establecen opciones para los elemntos de la barra de navegación
        self.navigationItem.setHidesBackButton(true, animated: false)
        title = "Lista de Usuarios"
        
//variables y configuracion del metodo get que pinta los datos en la tabla
        self.tableApiList.delegate = self
        self.tableApiList.dataSource = self
        
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

}
