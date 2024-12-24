//
//  ProductsListInteractor.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 20/12/24.
//

import Foundation

class ProductsListInteractor {
    func getProductsList() async -> ProductResponseEntity{
        let requestModel = RequestModel(endpoint: .products, httpMethod: .GET)
        let url = URL(string: requestModel.getURL())
        let (data, _) = try! await URLSession.shared.data(from: url!)
        return try! JSONDecoder().decode(ProductResponseEntity.self, from: data)
    }
}

