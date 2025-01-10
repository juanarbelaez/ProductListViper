//
//  NewProductPresenter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 7/01/25.
//

import Foundation

protocol NewProductUI: AnyObject {
    
}

protocol NewProductPresentable: AnyObject {
    
    var ui: NewProductUI? { get }
    
    func onTapNew ()
}


class NewProductPresenter: NewProductPresentable {
    
    weak var ui: NewProductUI?
    private let newProductDetailInteractor: NewProductInteractor
    private let router: NewProductRouting
    
    init(newProductDetailInteractor: NewProductInteractor, router: NewProductRouting) {
        self.newProductDetailInteractor = newProductDetailInteractor
        self.router = router
    }

    func onTapNew() {
//        Comunicar a Interactor el Model a Crear
    }
    
    
}
