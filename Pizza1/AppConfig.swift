//
//  AppConfig.swift
//  Pizza1
//
//  Created by admin on 11.03.2023.
//

import Foundation

struct AppConfig : Codable{
    let productList: ProductList

    struct ProductList: Codable {
        let pizzaList: [Pizza]
        let rollList: [Rolls]
    }
}

