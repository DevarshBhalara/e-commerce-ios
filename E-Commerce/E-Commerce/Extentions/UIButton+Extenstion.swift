//
//  UIButton+Extenstion.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

import Foundation
import UIKit

@IBDesignable
class RadioButton: UIButton {
    
    // Radio button properties
    @IBInspectable var isChecked: Bool = false {
        didSet {
            updateButton()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        updateButton()
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateButton()
        
    }
    
    @objc func buttonTapped() {
        isChecked = !isChecked
    }
    
    // Update button appearanceprivate
    private func updateButton() {
        let image = isChecked ? UIImage(named: "radioSelected") : UIImage(named: "radio")
        setImage(image, for: .normal)
    }
    
}
