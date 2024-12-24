//
//  ProductEntity.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 20/12/24.
//

import Foundation

struct ProductEntity: Decodable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: String
    
    enum Category: String, Decodable {
        case electronics = "electronics"
        case jewelery = "jewelery"
        case menSClothing = "men's clothing"
        case womenSClothing = "women's clothing"
    }
}


typealias ProductResponseEntity = [ProductEntity]

