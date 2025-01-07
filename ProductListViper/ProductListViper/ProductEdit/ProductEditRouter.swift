//
//  ProductEditRouter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 6/01/25.
//

import Foundation
import UIKit

protocol ProductEditRouting: AnyObject {
    var productEditView: ProductEditView? {get}
    
    func showEditDetails (fromViewController: UIViewController, withProduct product: ProductDetailEntity )
}

class ProductEditRouter: ProductEditRouting {
    
    var productEditView: ProductEditView?
    
//    Arreglar problema = 
    
    
    func showEditDetails(fromViewController: UIViewController, withProduct product: ProductDetailEntity) {
        
        let productEditInteractor = ProductEditInteractor()
        let productEditPresenter = ProductEditPresenter(productToEdit: product, router: self, productEditInteractor: productEditInteractor)
        productEditView = ProductEditView(presenter: productEditPresenter)
        productEditPresenter.ui = productEditView
        
        fromViewController.present(productEditView!, animated: true)
    }
    
    
    
}
