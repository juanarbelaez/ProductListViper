//
//  NewProductRouter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 7/01/25.
//
import Foundation
import UIKit

protocol NewProductRouting: AnyObject {
    var newProductView : NewProductView? {get}
    
    func showNew(fromViewController: UIViewController)
}


class NewProductRouter: NewProductRouting{
    
    var newProductView : NewProductView?
    
    
    func showNew(fromViewController: UIViewController){
        
        let newProductInteractor = NewProductInteractor()
        let newProductPresenter = NewProductPresenter(newProductDetailInteractor: newProductInteractor, router: self)
        newProductView = NewProductView(presenter: newProductPresenter)
        newProductPresenter.ui = newProductView
        
        fromViewController.present(newProductView!, animated: true)
        
    }
}
