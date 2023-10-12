//
//  CategoryProductViewModel.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 12/10/23.
//

class CategoryProductViewModel {
    
    //MARK: - Outlets
    var products = Dynamic<[CategoryData]>([])
    var error = Dynamic<String>("")
    
    func getCategoryProduct(category: String) {
        APIManager.shared.call(type: .categoryProduct(category)) { [weak self] (result: Result<[CategoryData], CustomError>) in
            
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

