//
//  ProductCollectionViewHeader.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

import UIKit

class ProductCollectionViewHeader: UICollectionReusableView {
    
    //MARK: - Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureHeader(data: String) {
        lblName.text = data.capitalized
    }
}
