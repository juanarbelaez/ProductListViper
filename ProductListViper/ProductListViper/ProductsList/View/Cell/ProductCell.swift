//
//  ProductCell.swift
//  ProductListViper
//
//  Created by Juan Arbelaez on 21/12/24.
//

import UIKit
import Kingfisher

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: ProductEntity){
        
        productImage.kf.setImage(with: URL(string: model.image))
        productName.text = model.title
        productCategory.text = model.category.rawValue
        productPrice.text = String(model.price)
    }
    
}
