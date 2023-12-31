//
//  UITextField+extension.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 23/08/23.
//

import Foundation
import UIKit

@IBDesignable
class TextFieldCustom: UITextField {
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            rightViewMode = .always
            let imageView = UIImageView(image: rightImage?.resizedImage(to: CGSizeMake(22, 22)))
            imageView.tintColor = .lightGray
            imageView.contentMode = .right
            rightView = imageView
            rightView?.tintColor = .lightGray
        }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            leftViewMode = .always
            let imageView = UIImageView(image: leftImage?.resizedImage(to: CGSizeMake(22, 22)))
            imageView.tintColor = .lightGray
            imageView.contentMode = .left
            leftView = imageView
            leftView?.tintColor = .lightGray
        }
    }
    
    let textPadding = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 40)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .init(top: 0, left: 0, bottom: 0, right: 15))
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    private func updateView() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        returnKeyType = .done
    }
}

@IBDesignable
class TextFieldPassword: UITextField {
    
    let button = UIButton(type: .custom)
    let textPadding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 3, left: 15, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }


    private func updateView() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        returnKeyType = .done
    }
    
    func enablePasswordToggle(){
            
            button.setImage(UIImage(systemName: "eye"), for: .normal)
            button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 15)
            button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        button.tintColor = .black
            rightView = button
            rightViewMode = .always
            button.alpha = 1
        }
        
        @objc func togglePasswordView(_ sender: Any) {
            isSecureTextEntry.toggle()
            button.isSelected.toggle()
        }
}
