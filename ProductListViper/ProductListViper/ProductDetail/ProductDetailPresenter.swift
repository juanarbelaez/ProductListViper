//
//  ProductDetailPresenter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 23/12/24.
//

import Foundation
import SkeletonView

protocol ProductDetailUI: AnyObject {
    func update(productDetail: ProductDetailEntity)
}

protocol ProductDetailPresentable: AnyObject {
    var ui: ProductDetailUI? {get}
    var productId: String {get}
    
    func onViewAppear()
}

class ProductDetailPresenter: ProductDetailPresentable {
    
    let productId: String
    private let productDetailInteractor: ProductDetailInteractor
    
    weak var ui: ProductDetailUI?
    
    var productDetail: ProductDetailEntity = ProductDetailEntity(id: 0, title: "", price: 0.0, category: ProductDetailEntity.Category.menSClothing, description: "", image: "")
    
    
    init(productId: String, productDetailInteractor: ProductDetailInteractor) {
        self.productDetailInteractor = productDetailInteractor
        self.productId = productId
    }
    
    
    func onViewAppear() {
        Task{
            
           
            productDetail = await productDetailInteractor.getProductDetail(whitId: productId)
            await MainActor.run{
                self.ui?.update(productDetail: productDetail)
            }
        }
        
    }
    
}
