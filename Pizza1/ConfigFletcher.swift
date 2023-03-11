//
//  ConfigFletcher.swift
//  Pizza1
//
//  Created by admin on 11.03.2023.
//

import Foundation

class ConfigFletcher{
    
    let configURL = URL(string: "https://raw.githubusercontent.com/Schultz91155/Pizza1/main/Pizza1/ProductStorage.json")!
    
    func fetchConfig (completion : @escaping ((Error? , AppConfig?) -> Void) ){
        
        let request = URLRequest(url: configURL)
        let task = URLSession.shared.dataTask(with: request,
                                              completionHandler: {(complitionHAndlerData, complitionHandlerResponse, copmlitionHandlerError) in
        if let error = copmlitionHandlerError{
                print(error)
                completion(error, nil)
            }
            
            guard let data = complitionHAndlerData else {return}
            let JSONString = String(data: data, encoding: .utf8)
            do{
                let storage = try JSONDecoder().decode(AppConfig.self, from: data)
                completion(nil, storage)
            }
            
            catch{
                print(error)
                completion(error, nil)
            }
        })
        
        task.resume()
        
        
        
    }
}
