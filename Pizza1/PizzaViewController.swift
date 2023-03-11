//
//  PizzaViewController.swift
//  Pizza1
//
//  Created by admin on 05.03.2023.
//

import UIKit
import Kingfisher


class PizzaViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    //создаем экземпляр класса типа configFetcher
    let fetcher = ConfigFletcher()
    
    var config : AppConfig? {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        /*
        Создание JSON
        let config = AppConfig(productList:
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
        */

        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        fetcher.fetchConfig{ [weak self] (error, config) -> Void in
            
            if let error = error{
                return
            }
            
            self?.config = config
        }
    }
    
    


}

extension PizzaViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        config?.productList.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        if
            let pizzaCell = cell as? PizzaCell,
            let pizza = config?.productList[indexPath.row]{
            pizzaCell.titleLabel.text = pizza.title
            pizzaCell.descriptionLabel.text = pizza.description
            let url = URL(string: pizza.imageLink)!
            pizzaCell.imageViewCell.kf.setImage(with: Source.network(url))
            
            
        }
            
        
        return cell
    }
    

    
    
}

extension PizzaViewController : UITableViewDelegate{
    
}

class PizzaCell : UITableViewCell{
    

    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
}
