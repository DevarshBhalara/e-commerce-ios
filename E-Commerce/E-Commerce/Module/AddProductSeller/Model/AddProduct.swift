//
//  AddProduct.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 24/10/23.
//

struct AddProduct: Codable {
    let sName: String?
    let sBrandName: String?
    let dPrice: Float?
    let sDescription: String?
    let sCategory: String?
    let sImage: String?
    
    func requestParam() -> [String:Any] {
        var param: [String:Any] = [:]
        param["sName"] = sName
        param["sBrandName"] = sBrandName
        param["dPrice"] = dPrice
        param["sDescription"] = sDescription
        param["sCategory"] = sCategory
        param["sImage"] = sImage
        return param
    }
}

struct AddProductResponse: Codable {
    
}
