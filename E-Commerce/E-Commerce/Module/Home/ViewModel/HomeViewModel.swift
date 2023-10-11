//
//  HomeViewModel.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 10/10/23.
//

import Foundation
class HomeViewModel {
    
    //MARK: - Variables
    var products = Dynamic<[ProductData]?>(nil)
    
    func getInitialProduct() {
        APIManager.shared.call(type: .initialProducts) { [weak self] (result: Result<[ProductData], CustomError>) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let products):
                self.products.value = products
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
