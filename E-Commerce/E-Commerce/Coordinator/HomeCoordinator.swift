//
//  HomeCoordinator.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 10/10/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeVC.instantiate(from: .home)
        vc.homeCoordinator = self
        navigationController.viewControllers = [vc]
    }
    
}
