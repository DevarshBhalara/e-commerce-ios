//
//  HomeSellerProductTableCell.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 23/10/23.
//

import UIKit

class HomeSellerProductTableCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblBrandName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    func configureCell(data: CategoryData) {
        imgProduct.kf.setImage(with: URL(string: "https://i.ibb.co/tHL2KLD/iphone13.jpg"))
        lblProductName.text = data.sName
        lblBrandName.text = data.sBrandName
        lblPrice.text = "\(data.dPrice ?? 0.0)"
    }
    
}
