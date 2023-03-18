//
//  DetailsPizzaViewController.swift
//  Pizza1
//
//  Created by admin on 18.03.2023.
//

import UIKit

class DetailsPizzaViewController: UIViewController {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var pizza : Pizza?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = pizza?.title
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    
    

}
