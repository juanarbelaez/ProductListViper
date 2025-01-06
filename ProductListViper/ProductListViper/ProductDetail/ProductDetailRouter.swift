//
//  ProductDetailRouter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 23/12/24.
//

import Foundation
import UIKit

protocol ProductDetailRouting: AnyObject {
    func showDetails(fromViewController: UIViewController, withProductId productId: String)
}

class ProductDetailRouter: ProductDetailRouting {
    
    func showDetails(fromViewController: UIViewController, withProductId productId: String){
        let productDetailInteractor = ProductDetailInteractor()
        let productDetailPresenter = ProductDetailPresenter(productId: productId, productDetailInteractor: productDetailInteractor)
        let view = ProductDetailView(presenter: productDetailPresenter)
        productDetailPresenter.ui = view
        
        fromViewController.present(view, animated: true)
    }
}
