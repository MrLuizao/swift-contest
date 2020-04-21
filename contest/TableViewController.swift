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
    
    var arr_data_id = [String]()
    var arr_data_name = [String]()
    
    
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
                print(resp.result)
                
                let items = try? JSON(data: resp.data!)
                print(items!["data"])
                
                let resultArray = items!["data"]
                
                self.arr_data_id.removeAll()
                self.arr_data_name.removeAll()
                
                for i in resultArray.arrayValue{
                    print(i)
                    let id = i["id"].stringValue
                    self.arr_data_id.append(id)
                    
                    let name = i["first_name"].stringValue
                    self.arr_data_name.append(name)
                }
                
                self.tableApiList.reloadData()
                break
                
            case .failure:
                print(resp.error!)
                break
                
            }

        }
    
    }
//se establecen los valores de la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_data_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arr_data_name[indexPath.row]
        cell.accessoryType = .disclosureIndicator //Indicador de acciòn al final de la fila
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


}
