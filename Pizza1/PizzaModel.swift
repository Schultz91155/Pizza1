//
//  Model.swift
//  Pizza1
//
//  Created by admin on 05.03.2023.
//

import Foundation



struct Pizza : Codable
{
    let title : String
    let description : String
    let cost : Int
    let imageLink : String
    let price : Price
    let fullDescription : String
    
    
    /*enum Size : Codable
    {
        case small
        case medium
        case large
    }*/
    
    struct Price: Codable{
        let small : Int?
        let medium : Int?
        let large : Int?
    }
}

struct Rolls : Codable

{
    let title : String
    let description : String
    let cost : Int
    let imageLink : String
    let quantity : Int
    let fullDescription : String
}




