//
//  File.swift
//  My Spotify
//
//  Created by Krunal Patel on 04/07/23.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        KeychainHelper.shared.accessToken == nil  ? goToAuth() : goToCombineScreen()
    }
    
    func goToCombineScreen() {
        if (KeychainHelper.shared.role == "USER") {
            let combineCoordinator = HomeCoordinator(navigationController: navigationController)
            self.window.rootViewController = navigationController
            combineCoordinator.start()
        } else {
            let homeSellerCoordinator = HomeSellerCoordinator(navigationController: navigationController)
            self.window.rootViewController = navigationController
            homeSellerCoordinator.start()
        }
    }
    
    func goToAuth(with code: String? = nil) {
        let authCoordinator = AuthCoordinator(navigationController: navigationController, window: window)
        self.window.rootViewController = navigationController
        authCoordinator.start()
    }
}
