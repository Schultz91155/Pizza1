//
//  RollsViewController.swift
//  Pizza1
//
//  Created by admin on 12.03.2023.
//

import UIKit

class RollsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = [[Product(title: "", description: "", cost: 0, imageLink: "", size: "", type: "pizza")],[Product(title: "", description: "", cost: 0, imageLink: "", size: "", type: "rolls")]]
        
        if let data = try? JSONEncoder().encode(config){
            let JSONString = String(data: data, encoding: .utf8)
            print(JSONString)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
