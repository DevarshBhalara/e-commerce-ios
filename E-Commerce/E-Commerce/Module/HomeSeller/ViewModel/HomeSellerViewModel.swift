//
//  HomeSellerViewModel.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 23/10/23.
//

class HomeSellerViewModel {
    
    // MARK: - Variables
    var products = Dynamic<[CategoryData]>([])
    var error = Dynamic<String>("")
    
    init() {
        getSellerProducts()
    }
    
    func getSellerProducts() {
        APIManager.shared.call(type: .sellerProducts) { [weak self] (result: Result<[CategoryData], CustomError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let products):
                print(products)
                self.products.value = products
            case .failure(let error):
                self.error.value = error.body
            }
        }
    }
}
