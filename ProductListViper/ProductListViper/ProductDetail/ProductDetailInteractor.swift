//
//  ProductDetailInteractor.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 23/12/24.
//

import Foundation

protocol ProductDetailInteractable: AnyObject{
    func getProductDetail (whitId id: String) async -> ProductDetailEntity
}

class ProductDetailInteractor: ProductDetailInteractable {
    func getProductDetail (whitId id: String) async -> ProductDetailEntity{
        let requestModel = RequestModel(endpoint: .productDetail, httpMethod: .GET)
        let url = requestModel.getURL()
        let (data, _) = try! await URLSession.shared.data(from: URL(string: url+"\(id)")!)
        return try! JSONDecoder().decode(ProductDetailEntity.self, from: data)
    }
}
