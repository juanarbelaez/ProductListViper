//
//  SceneDelegate.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 20/12/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var productsListRouter = ProductsListRouter()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        productsListRouter.showProductsList(window: window)
        
    }
}

