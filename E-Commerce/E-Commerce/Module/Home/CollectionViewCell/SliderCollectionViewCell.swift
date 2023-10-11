//
//  SliderCollectionViewCell.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var imgSlider: UIImageView!
    
    func configureCell(data: SliderModel) {
        imgSlider.image = data.image
    }
}
