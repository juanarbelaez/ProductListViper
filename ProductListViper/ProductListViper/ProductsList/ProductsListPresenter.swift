//
//  ProductsListPresenter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 20/12/24.
//

import Foundation

protocol ProductsListUI: AnyObject {
    func update(products: [ProductEntity])
}

class ProductsListPresenter {
//  Instancia del Interactor
    private let productsListInteractor: ProductsListInteractor
//  Referencia a la view
    var ui: ProductsListUI?
    
    var models: [ProductEntity] = []
    
    
    init(productsListInteractor: ProductsListInteractor) {
        self.productsListInteractor = productsListInteractor
    }
    
//  funcion que llama al metodo del Interactor que realiza la petición http
    func onViewAppear() {
        Task {
            models = await productsListInteractor.getProductsList()
            ui?.update(products: models)
        }
    }
    
}
