//
//  HomeSellerCoordinator.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 19/10/23.
//

import UIKit

class HomeSellerCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeSellerVC.instantiate(from: .homeSeller)
        vc.homeSellerCoordinator = self
        navigationController.viewControllers = [vc]
    }
    
    func gotoAddProduct() {
        
    }
}
