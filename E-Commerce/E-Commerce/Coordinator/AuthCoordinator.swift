//
//  AuthCoordinator.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 21/08/23.
//

import UIKit

class AuthCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    

    func start() {
        let authVC = AuthVC.instantiate(from: .auth)
        authVC.authCoordinator = self
        navigationController.viewControllers = [authVC]
    }
    
    func goToHome() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()
    }
    
}

