//
//  NewProductView.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 7/01/25.
//

import UIKit

class NewProductView: UIViewController {
    
    @IBOutlet weak var categoryMenuButton: UIButton!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productDescription: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    
    private let presenter : NewProductPresentable
    var category: String = ""
//    var productDictionary : [String:Any] = [:]
    
    init(presenter: NewProductPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let electronics = UIAction(title: "electronics") { action  in
            self.category = "electronics"
        }
        let jewelery = UIAction(title: "jewelery") { action  in
            self.category = "jewelery"
        }
        let mensClothing = UIAction(title: "men's clothing") { action  in
            self.category = "men's clothing"
        }
        let womenClothing = UIAction(title: "women's clothing") { action  in
            self.category = "women's clothing"
        }
        categoryMenuButton.menu = UIMenu(children: [electronics, jewelery, mensClothing, womenClothing])
    }

    @IBAction func onTapSave(_ sender: Any) {
        let productDictionary : [String:AnyHashable] = [
            "title":productName.text!,
            "price": Double(productPrice.text!)!,
            "description":productDescription.text!,
            "image":"http://i.pravatar.cc",
            "category":category]

        presenter.onTapNew(productDictionary: productDictionary)
    }
}

extension NewProductView: NewProductUI {
    
    func update(){
        self.dismiss(animated: true)
        
    }
}
