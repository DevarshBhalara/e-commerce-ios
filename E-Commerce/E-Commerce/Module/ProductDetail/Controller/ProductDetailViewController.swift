//
//  ProductDetailViewController.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 12/10/23.
//

import UIKit

class ProductDetailViewController: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    @IBOutlet private weak var imgProduct: UIImageView!
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblPrice: UILabel!
    @IBOutlet private weak var lblDescription: UILabel!
    
    // MARK: - Variables
    var productDetailCoordinator: ProductDetailCoordinator?
    var product: CategoryData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindObservable()
    }
    
    private func bindObservable() {
        
    }
    
    private func setupUI() {
        if let product = product {
            imgProduct.kf.setImage(with: URL(string: "https://i.ibb.co/tHL2KLD/iphone13.jpg"))
            lblName.text = product.sName
            lblDescription.text = product.sDescription
            lblPrice.text = "\(product.dPrice ?? 0.0)"
        }
    }

}
