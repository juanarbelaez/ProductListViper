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
   
    
    @IBOutlet weak var productPrice: UITextField!
    
    private let presenter: ProductEditPresentable
    
    init(presenter: ProductEditPresentable){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.onViewAppear()
        
    }

}

extension ProductEditView: ProductEditUI {
    func update(productToEdit: ProductDetailEntity) {
        
        productImage.kf.setImage(with: URL(string: productToEdit.image))
        productName.text = productToEdit.title
        productDescription.text = productToEdit.description
        productPrice.text = String(productToEdit.price)
        
    }
}
