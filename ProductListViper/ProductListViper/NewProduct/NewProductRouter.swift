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
        
        fromViewController.present(newProductView!, animated: true)
    }
}
