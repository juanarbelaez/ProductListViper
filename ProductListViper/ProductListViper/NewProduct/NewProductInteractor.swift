//
//  NewProductInteractor.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 7/01/25.
//

import Foundation


protocol NewProductInteractable: AnyObject {
    func setNewProduct ()    // Falta Entity para guardar nuevo
}

class NewProductInteractor: NewProductInteractable {
    
    
    
    func setNewProduct ()    {
        
//   Comunicación a la API
    
        
        
        let requestModel = RequestModel(endpoint: .products, httpMethod: .POST)
        let url = requestModel.getURL()
        var urlRequest = URLRequest(url: URL(string: url)!)
        let dataDictionary: [String:AnyHashable] = [
            "title":"test product",
            "price":13.5,
            "description":"lorem ipsum set",
            "image":"http://i.pravatar.cc", "category":"electronic"]
   
        let requestBody = try? JSONSerialization.data(withJSONObject: dataDictionary, options: .fragmentsAllowed)
        urlRequest.httpBody = requestBody
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
      
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error  in
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            }catch {
                print(error)
            }
        }
        task.resume()
        
        
    }
        
}
