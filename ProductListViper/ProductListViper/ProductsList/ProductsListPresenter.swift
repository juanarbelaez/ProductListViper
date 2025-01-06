//
//  ProductsListPresenter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 20/12/24.
//

import Foundation

protocol ProductListPresentable: AnyObject{
    var ui: ProductsListUI? {get}
    var productViewModels: [ProductViewModel] {get}
    
    func onViewAppear()
    func onTapCell(atIndex: Int)
    
}

protocol ProductsListUI: AnyObject {
    func update(products: [ProductViewModel])
}

class ProductsListPresenter:  ProductListPresentable{
    
    
//  Instancia del Interactor
    private let productsListInteractor: ProductsListInteractable
//  Referencia a la view
    weak var ui: ProductsListUI?
    private let router: ProductsListRouting
    
    var productViewModels: [ProductViewModel] = []
    private var models: ProductResponseEntity = []
    
    init(router: ProductsListRouting, productsListInteractor: ProductsListInteractable) {
        self.productsListInteractor = productsListInteractor
        self.router = router
    }
    
//  funcion que llama al metodo del Interactor que realiza la petición http
    func onViewAppear() {
        Task {
            models = await productsListInteractor.getProductsList()
            productViewModels = models.map {entity in
                ProductViewModel(productName: entity.title, productCategory: entity.category.rawValue, productPrice: String(entity.price), productImageUrl: entity.image)
            }
            ui?.update(products: productViewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let productId = models[atIndex].id
        router.showDetailMovie(withMovieId: productId.description)
    }
    
}
