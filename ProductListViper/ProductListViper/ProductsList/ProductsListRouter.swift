//
//  ProductsListRouter.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 20/12/24.
//

import Foundation
import UIKit


class ProductsListRouter{
    
    func showProductsList(window: UIWindow?){
        let view = ProductsListView()
        let interactor = ProductsListInteractor()
        let presenter = ProductsListPresenter(productsListInteractor: interactor)
        presenter.ui = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
