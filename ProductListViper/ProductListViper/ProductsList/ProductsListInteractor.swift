//
//  ProductsListInteractor.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 20/12/24.
//

import Foundation

protocol ProductsListInteractable: AnyObject {
    func getProductsList() async -> ProductResponseEntity
}

class ProductsListInteractor: ProductsListInteractable{
    func getProductsList() async -> ProductResponseEntity{
        let requestModel = RequestModel(endpoint: .products, httpMethod: .GET)
        let url = URL(string: requestModel.getURL())
        let (data, _) = try! await URLSession.shared.data(from: url!)
        return try! JSONDecoder().decode(ProductResponseEntity.self, from: data)
    }
}

class ProductsListInteractorMock: ProductsListInteractable{
    func getProductsList() async -> ProductResponseEntity {
        return ProductResponseEntity([
            .init(id: 0, title: "Socks", price: 20.0, category: ProductEntity.Category.menSClothing, image: ""),
            .init(id: 1, title: "Socks", price: 20.0, category: ProductEntity.Category.menSClothing, image: ""),
            .init(id: 2, title: "Socks", price: 20.0, category: ProductEntity.Category.menSClothing, image: ""),
            .init(id: 3, title: "Socks", price: 20.0, category: ProductEntity.Category.menSClothing, image: ""),
        ])
        
    }
    
    
}






