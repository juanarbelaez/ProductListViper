//
//  NewProductPresenter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 7/01/25.
//

import Foundation

protocol NewProductUI: AnyObject {
    func update()
}

protocol NewProductPresentable: AnyObject {
    
    var ui: NewProductUI? { get }
    
    func onTapNew (productDictionary : [String:AnyHashable])
}


class NewProductPresenter: NewProductPresentable {
    
    weak var ui: NewProductUI?
    private let newProductInteractor: NewProductInteractor
    private let router: NewProductRouting
    
    init(newProductInteractor: NewProductInteractor, router: NewProductRouting) {
        self.newProductInteractor = newProductInteractor
        self.router = router
    }

    func onTapNew(productDictionary : [String:AnyHashable]) {
        
//        Comunicar a Interactor el Model a Crear
        newProductInteractor.setNewProduct(productDictionary: productDictionary)
        self.ui?.update()
        
    }
    
    
}
