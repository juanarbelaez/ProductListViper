//
//  ProductEditPresenter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 6/01/25.
//

import Foundation


protocol ProductEditUI: AnyObject {
    
    func update(productToEdit: ProductDetailEntity)
}

protocol ProductEditPresentable: AnyObject {
    
    var ui: ProductEditUI? {get}
    var productToEdit: ProductDetailEntity {get}
    
    func onViewAppear ()
        
}

class ProductEditPresenter: ProductEditPresentable {
    
    
    let productToEdit: ProductDetailEntity
    weak var ui: ProductEditUI?
    private let productEditInteractor: ProductEditInteractor
    private let router: ProductEditRouting
    
    init(productToEdit: ProductDetailEntity, router: ProductEditRouting, productEditInteractor: ProductEditInteractor) {
        self.productToEdit = productToEdit
        self.productEditInteractor = productEditInteractor
        self.router = router
    }
    
    func onViewAppear() {
        
        self.ui?.update(productToEdit: productToEdit)
        
    }
}
