//
//  ProductsListView.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 21/12/24.
//

import UIKit

class ProductsListView: UIViewController {

    @IBOutlet weak var productsListTableView: UITableView!
    
    var presenter: ProductsListPresenter?
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        configTableView()
        presenter?.onViewAppear()
        
    }
    
    func configTableView(){
        
        let nibProduct = UINib(nibName: "\(ProductCell.self)", bundle: nil)
        productsListTableView.register(nibProduct, forCellReuseIdentifier: "\(ProductCell.self)")
        
        productsListTableView.dataSource = self
    }


 

}


extension ProductsListView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductCell.self)", for: indexPath) as! ProductCell
        let model = presenter!.models[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    
}


extension ProductsListView: ProductsListUI {
    func update(products: [ProductEntity]) {
        print("Datos recibidos", products)
        DispatchQueue.main.async {
            self.productsListTableView.reloadData()
        }
    }
    
    
    
    
}
