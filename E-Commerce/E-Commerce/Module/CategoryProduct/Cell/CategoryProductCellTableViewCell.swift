//
//  CategoryProductCellTableViewCell.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 12/10/23.
//

import UIKit

class CategoryProductCellTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imgProdcut: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    func configureCell(data: CategoryData) {
        imgProdcut.kf.setImage(with: URL(string: "https://i.ibb.co/tHL2KLD/iphone13.jpg"))
        lblName.text = data.sName
        lblPrice.text = "\(data.dPrice ?? 0.0)"
        lblDescription.text = data.sDescription
    }
    
    
}
