//
//  CategorySellerCVCell.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 19/10/23.
//

import UIKit

class CategorySellerCVCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var imgCategory: UIImageView!
    @IBOutlet private weak var lblCategoryName: UILabel!
    
    func configureCell(data: CategoryModel) {
        imgCategory.image = data.image
        lblCategoryName.text = data.title
    }
}
