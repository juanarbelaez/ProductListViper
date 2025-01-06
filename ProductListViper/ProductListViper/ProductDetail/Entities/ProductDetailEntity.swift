//
//  ProductDetailEntity.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 24/12/24.
//

import Foundation

struct ProductDetailEntity: Decodable {
    let id: Int
    let title: String
    let price: Double
    let category: Category
    let description: String
    let image: String
    
    enum Category: String, Decodable {
        case electronics = "electronics"
        case jewelery = "jewelery"
        case menSClothing = "men's clothing"
        case womenSClothing = "women's clothing"
    }
}
