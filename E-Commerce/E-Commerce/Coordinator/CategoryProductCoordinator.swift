//
//  CategoryProductCoordinator.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 12/10/23.
//

import Foundation
import UIKit
class CategoryProductCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var category: String
    
    init(navigationController: UINavigationController, category: String) {
        self.navigationController = navigationController
        self.category = category
    }
    
    func start() {
        let vc = CategoryProductVC.instantiate(from: .categoryProduct)
        vc.categoryProductCoordinator = self
        vc.category = category
        navigationController.pushViewController(vc, animated: true)
    }
    
}
