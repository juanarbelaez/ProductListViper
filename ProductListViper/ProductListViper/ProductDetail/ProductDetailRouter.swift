//
//  ProductDetailRouter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 23/12/24.
//

import Foundation
import UIKit

protocol ProductDetailRouting: AnyObject {
    
    var productEditRouter: ProductEditRouting? {get}
    var productDetailView: ProductDetailView? {get}
    
    func showDetails(fromViewController: UIViewController, withProductId productId: String)
    func showEditDetails(withProductModel product: ProductDetailEntity)
}

class ProductDetailRouter: ProductDetailRouting {
    
    var productEditRouter: ProductEditRouting?
    var productDetailView: ProductDetailView?
   
    func showDetails(fromViewController: UIViewController, withProductId productId: String){
        let productDetailInteractor = ProductDetailInteractor()
        let productDetailPresenter = ProductDetailPresenter(productId: productId, router: self, productDetailInteractor: productDetailInteractor)
        productDetailView = ProductDetailView(presenter: productDetailPresenter)
        productDetailPresenter.ui = productDetailView
        
        fromViewController.present(productDetailView!, animated: true)
    }
    
    func showEditDetails(withProductModel product: ProductDetailEntity) {
        guard let fromViewController = productDetailView else {
            return
        }
        
        productEditRouter?.showEditDetails(fromViewController: fromViewController, withProduct: product)
        
    }
}
