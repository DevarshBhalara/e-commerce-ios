//
//  ProductCollectionViewCell.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: outlets
    @IBOutlet weak var imgProdcut: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    func configureCell(data: CategoryData) {
        imgProdcut.kf.setImage(with: URL(string: "https://i.ibb.co/tHL2KLD/iphone13.jpg"))
        lblName.text = data.sName
        lblPrice.text = "\(data.dPrice ?? 0.0)"
    }
    
}
