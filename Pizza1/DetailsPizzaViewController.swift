//
//  DetailsPizzaViewController.swift
//  Pizza1
//
//  Created by admin on 18.03.2023.
//

import UIKit

class DetailsPizzaViewController: UIViewController {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sizeSegmetedControl: UISegmentedControl!
    @IBOutlet weak var priceLabel: UILabel!
    
    var pizza : Pizza?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = pizza?.title
      
        updatePrices()
        
        sizeSegmetedControl.addTarget(self, action: #selector(sizeSegmetedControlPressed),
                                      for: .valueChanged)
    }
    
    @objc func sizeSegmetedControlPressed() {
        let newSegmenteIndex = sizeSegmetedControl.selectedSegmentIndex
        let prices = Array(prices.values)
        let price = prices[newSegmenteIndex]
        priceLabel.text = "\(price) RUB"
    }
    
    var prices = [String: Int]()
    
    func updatePrices() {
        sizeSegmetedControl.removeAllSegments()
        prices.removeAll()
        
        let allPrices = [
            "Small" : pizza?.price.small,
            "Medium" : pizza?.price.medium,
            "Large": pizza?.price.large
        ]

        var segments = [String: Int]()
        for (sizeName, price) in allPrices {
            if let price = price {
                segments[sizeName] = price
            }
        }
        self.prices = segments
        for (index,(sizeName, price)) in segments.enumerated() {
            sizeSegmetedControl.insertSegment(withTitle: sizeName, at: index, animated: true)
//            sizeSegmetedControl.setTitle(sizeName, forSegmentAt: index)
        }
        sizeSegmetedControl.selectedSegmentIndex = 0
        if let firstPrice = prices.first {
//            priceLabel.text = String(describing: firstPrice.value)
            priceLabel.text = "\(firstPrice.value) RUB"
        }
        
    }
   
}
