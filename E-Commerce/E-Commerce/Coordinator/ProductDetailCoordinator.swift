//
//  ProductDetailCoordinator.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 19/10/23.
//

import UIKit

class ProductDetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var product: CategoryData
    
    init(navigationController: UINavigationController, product: CategoryData) {
        self.navigationController = navigationController
        self.product = product
    }
    
    func start() {
        let vc = ProductDetailViewController.instantiate(from: .productDetail)
        vc.productDetailCoordinator = self
        vc.product = product
        navigationController.pushViewController(vc, animated: true)
    }
    
}
