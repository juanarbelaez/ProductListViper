//
//  ProductDetailView.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 24/12/24.
//

import UIKit
import Kingfisher
import SkeletonView

class ProductDetailView: UIViewController {
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    
    private let presenter: ProductDetailPresentable
    
    init(presenter: ProductDetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
//        setupView()
        presenter.onViewAppear()
        
//        Skeleton

        setupSkeleton()
        

    }
    
    func setupSkeleton(){
        
        productImage.isSkeletonable = true
        productName.isSkeletonable = true
        productPrice.isSkeletonable = true
        productCategory.isSkeletonable = true
        productDescription.isSkeletonable = true
        
        productImage.showAnimatedGradientSkeleton()
        productName.showAnimatedGradientSkeleton()
        productPrice.showAnimatedGradientSkeleton()
        productCategory.showAnimatedGradientSkeleton()
        productDescription.showAnimatedGradientSkeleton()

        
        
    }

    func setupView(){
        
    }

    @IBAction func onTapEdit(_ sender: Any) {
        
        
    }
    
}

extension ProductDetailView: ProductDetailUI{
    func update(productDetail: ProductDetailEntity) {
        
        
        productImage.hideSkeleton()
        productName.hideSkeleton()
        productPrice.hideSkeleton()
        productCategory.hideSkeleton()
        productDescription.hideSkeleton()

        
        productImage.kf.setImage(with: URL(string: productDetail.image))
        productName.text = productDetail.title
        productDescription.text = productDetail.description
        productCategory.text = productDetail.category.rawValue
        productPrice.text = String(productDetail.price)
    
    }
}
