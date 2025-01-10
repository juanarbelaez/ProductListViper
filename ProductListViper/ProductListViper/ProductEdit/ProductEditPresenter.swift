//
//  ProductEditPresenter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 6/01/25.
//

import Foundation


protocol ProductEditUI: AnyObject {
    
    func update(productToEdit: ProductDetailEntity)
    func dismissEditView()
}

protocol ProductEditPresentable: AnyObject {
    
    var ui: ProductEditUI? {get}
    var productToEdit: ProductDetailEntity {get}
    
    func onViewAppear ()
    func onTapSave (productDictionary : [String:AnyHashable])
        
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
    
    func onTapSave (productDictionary : [String:AnyHashable]){
        
        productEditInteractor.setNewProduct(productDictionary: productDictionary)
        self.ui?.dismissEditView()
    }
    
    
}
