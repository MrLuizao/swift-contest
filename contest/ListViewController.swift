//
//  ListViewController.swift
//  contest
//
//  Created by LKY on 18/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


//se declara el tipo de autenticación
enum ProviderType: String {
    case basic
}

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var arr_data_id = [String]()
    var arr_data_name = [String]()
    
    @IBOutlet weak var apiListTable: UITableView!
    
//declaracion de los elementos y variables
    private let email: String
    private let provider: ProviderType
    private let primaryColor = UIColor(displayP3Red: 154/255, green: 60/255, blue: 187/255, alpha: 1)
    
//constructor que inicializa los elementos para la autenticación
   init (email: String, provider: ProviderType){
           self.email = email
           self.provider = provider
           super.init(nibName: nil, bundle: nil)
       }
    required init?(coder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }
    
    
    override func viewDidLoad() { //inicia ciclo de vida de la app
        super.viewDidLoad()
//se establecen opciones para los elemntos de la barra de navegación
        self.navigationItem.setHidesBackButton(true, animated: false)
        title = "Lista de Usuarios"
        
        self.apiListTable.delegate = self
        self.apiListTable.dataSource = self
        
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
                self.apiListTable.reloadData()
                break
                
            case .failure:
                print(resp.error!)
                break
                
            }
        }
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_data_id.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.textLabel?.text = arr_data_name[indexPath.row]
        cell.accessoryType = .disclosureIndicator //Indicador de acciòn al final de la fila
        return cell
    }

    
}


