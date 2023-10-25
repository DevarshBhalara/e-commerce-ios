//
//  AddProductViewModel.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 24/10/23.
//

import UIKit

class AddProductViewModel {
    
    //MARK: - Variables
    var success = Dynamic<String>("")
    var imageUrl = Dynamic<String>("")
    var error = Dynamic<String>("")
    var validationError = Dynamic<String>("")
    
    func validData(imgUrl: String, name: String, description: String, category: String, price: Float, brandName: String) {
        if imgUrl.trimmingCharacters(in: .whitespaces).isEmpty {
            validationError.value = "Please Add Image."
        } else if name.trimmingCharacters(in: .whitespaces).isEmpty {
            validationError.value = "Please enter Name."
        } else if description.trimmingCharacters(in: .whitespaces).isEmpty {
            validationError.value = "Please Enter Descirption."
        } else if description.trimmingCharacters(in: .whitespaces).count < 50 {
            validationError.value = "Description should be greater then 50 characters."
        } else if price <= 0.0  {
            validationError.value = "Please enter valid Price."
        } else if category.isEmpty {
            validationError.value = "Please enter Category."
        } else if brandName.trimmingCharacters(in: .whitespaces).isEmpty {
            validationError.value = "Please enter Brand name."
        } else {
            addProduct(product: AddProduct(sName: name, sBrandName: brandName, dPrice: price, sDescription: description, sCategory: category, sImage: imgUrl))
        }
    }
    
    private func addProduct(product: AddProduct) {
        APIManager.shared.call(type: .addProduct, params: product.requestParam()) { [weak self] (result: Result<AddProductResponse, CustomError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(_):
                self.success.value = "Product Added Successfully."
            case .failure(let error):
                self.error.value = error.body
            }
        }
    }
    
    func uploadImage(image: UIImage) {
        APIManager.shared.callUploadApi(type: .uploadImage, image: image) { [weak self] (result: Result<ImageUploadResponse, CustomError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let image):
                if let url = image.data?.url {
                    self.imageUrl.value = url
                } else {
                    self.error.value = "Please try Again!."
                }
            case .failure(let error):
                self.error.value = error.body
            }
            
            
        } progress: { progress in
            print(progress)
        }

    }
}
