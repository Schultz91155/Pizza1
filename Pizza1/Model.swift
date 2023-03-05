//
//  Model.swift
//  Pizza1
//
//  Created by admin on 05.03.2023.
//

import Foundation



struct Product : Codable
{
    let title : String
    let description : String
    let cost : Int
    let imageLink : String
    let size : String
}

struct ProductStorage : Codable{
    var productList : [Product]
}


