//
//  ProductsListRouter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 20/12/24.
//

import Foundation
import UIKit

protocol ProductsListRouting: AnyObject {
    var productDetailRouter: ProductDetailRouting? { get }
    var newProductRouter: NewProductRouting? { get }
    var productsListView: ProductsListView? { get }
    
    
    
    func showProductsList(window: UIWindow?)
    func showDetailMovie(withMovieId movieId: String)
    func showNewProduct()
}


class ProductsListRouter:ProductsListRouting {
    
    var newProductRouter: NewProductRouting?
    var productDetailRouter: ProductDetailRouting?
    var productsListView: ProductsListView?
    
    
    func showProductsList(window: UIWindow?){
        
        self.productDetailRouter = ProductDetailRouter()
        self.newProductRouter = NewProductRouter()
        let interactor = ProductsListInteractor() 
        let presenter = ProductsListPresenter(router: self, productsListInteractor: interactor)
        
        productsListView = ProductsListView(presenter: presenter)
        presenter.ui = productsListView
//        view.presenter = presenter
        
        window?.rootViewController = productsListView
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovie(withMovieId movieId: String){
        guard let fromViewController = productsListView else {
            return
        }
        productDetailRouter?.showDetails(fromViewController: fromViewController, withProductId: movieId)
    }
    
    func showNewProduct() {
        guard let fromViewController = productsListView else {
            return
        }
        newProductRouter?.showNew(fromViewController: fromViewController)
    }
}
