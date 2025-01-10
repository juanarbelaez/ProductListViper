//
//  ProductEditInteractor.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 6/01/25.
//

import Foundation

protocol ProductEditInteractable: AnyObject {
    
    func setNewProduct (productDictionary : [String:AnyHashable])
    
}

class ProductEditInteractor: ProductEditInteractable {
    func setNewProduct(productDictionary: [String : AnyHashable]) {
        let requestModel = RequestModel(endpoint: .products, httpMethod: .POST)
        let url = requestModel.getURL()
        var urlRequest = URLRequest(url: URL(string: url)!)
    /*    let dataDictionary: [String:AnyHashable] = [
            "title":"test product",
            "price":13.5,
            "description":"lorem ipsum set",
            "image":"http://i.pravatar.cc", "category":"electronic"]
   */
        let requestBody = try? JSONSerialization.data(withJSONObject: productDictionary)
        urlRequest.httpBody = requestBody
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
      
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error   in
            guard let data = data, error == nil else {
                return
            }
            print(data)
            do {
               
                let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                
            }catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
    
    
    
}
