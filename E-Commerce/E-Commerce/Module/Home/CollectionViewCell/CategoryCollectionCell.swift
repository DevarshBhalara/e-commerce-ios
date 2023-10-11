//
//  CategoryCollectionCell.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgCategory: UIImageView!
    
    func configureCell(data: CategoryModel) {
        imgCategory.image = data.image
        lblName.text = data.title
    }
    
}
