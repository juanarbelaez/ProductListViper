//
//  ProductsListView.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 21/12/24.
//

import UIKit
import SkeletonView

class ProductsListView: UIViewController {

    @IBOutlet weak var productsListTableView: UITableView!
    
    private let presenter: ProductListPresentable
    
    init(presenter: ProductListPresentable){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray2
        
        configTableView()
        
        presenter.onViewAppear()
        setupSkeleton()
        
        
    }
    
    func configTableView(){
        
        let nibProduct = UINib(nibName: "\(ProductCell.self)", bundle: nil)
        productsListTableView.register(nibProduct, forCellReuseIdentifier: "\(ProductCell.self)")
        
        productsListTableView.dataSource = self
        productsListTableView.delegate = self
    }
    
    func setupSkeleton(){
        productsListTableView.isSkeletonable = true
        
        productsListTableView.showAnimatedGradientSkeleton()
        
        
        
//        productImage.isSkeletonable = true
//        productName.isSkeletonable = true
//        productPrice.isSkeletonable = true
//        productCategory.isSkeletonable = true
//        productDescription.isSkeletonable = true
//
//        productImage.showAnimatedGradientSkeleton()
//        productName.showAnimatedGradientSkeleton()
//        productPrice.showAnimatedGradientSkeleton()
//        productCategory.showAnimatedGradientSkeleton()
//        productDescription.showAnimatedGradientSkeleton()

        
        
    }
}


extension ProductsListView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.productViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductCell.self)", for: indexPath) as! ProductCell
        let model = presenter.productViewModels[indexPath.row]
        cell.configure(model: model)
        return cell
    }
}


extension ProductsListView: ProductsListUI {
    func update(products: [ProductViewModel]) {
//        print("Datos recibidos", products)
        DispatchQueue.main.async {
            self.productsListTableView.hideSkeleton()
            self.productsListTableView.reloadData()
        }
    }
}

extension ProductsListView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}
