//
//  PizzaViewController.swift
//  Pizza1
//
//  Created by admin on 05.03.2023.
//

import UIKit

class PizzaViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let config = ProductStorage(productList:
        [
            Product(title: "Ветчина и сыр ",
                    description: "",
                    cost: 500,
                    imageLink: "",
                    size: ""),
            Product(title: "Ветчина и грибы ",
                    description: "",
                    cost: 700,
                    imageLink: "",
                    size: ""),
            Product(title: "4 сыра",
                    description: "",
                    cost: 750 ,
                    imageLink: "",
                    size: "")
            
        ]
        )
        
        if let jsonData = try?  JSONEncoder().encode(config){
            let jsonString = String(data: jsonData, encoding: .utf8)
            print(jsonString)
        }
        

        // Do any additional setup after loading the view.
    }
    
    


}

extension PizzaViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        guard let myCell = cell as? PizzaCell else{
            return cell
        }
        return myCell
    }
    

    
    
}

extension PizzaViewController : UITableViewDelegate{
    
}

class PizzaCell : UITableViewCell{
    
    
    @IBOutlet weak var imageCell: UIImageView!
    
}
