//
//  ProductEditView.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 2/01/25.
//

import UIKit
import Kingfisher




class ProductEditView: UIViewController {
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var categoryMenuButton: UIButton!
    @IBOutlet weak var productPrice: UITextField!
    
    private let presenter: ProductEditPresentable
    var category: String = ""
    
    init(presenter: ProductEditPresentable){
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
        
        presenter.onViewAppear()
        
    }
    
    @IBAction func onTapSave(_ sender: Any) {
        
        let productDictionary : [String:AnyHashable] = [
            "title":productName.text!,
            "price": Double(productPrice.text!)!,
            "description":productDescription.text!,
            "image":"http://i.pravatar.cc",
            "category":category]

            presenter.onTapSave(productDictionary: productDictionary)
        
    }
}

extension ProductEditView: ProductEditUI {
    func dismissEditView() {
        self.dismiss(animated: true)
    }

    func update(productToEdit: ProductDetailEntity) {
        
        productImage.kf.setImage(with: URL(string: productToEdit.image))
        productName.text = productToEdit.title
        productDescription.text = productToEdit.description
        productPrice.text = String(productToEdit.price)
    }
}
