//
//  AddProductCoordinator.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 24/10/23.
//

import UIKit

class AddProductCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AddProductVC.instantiate(from: .addProductSeller)
        vc.addProdctCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
