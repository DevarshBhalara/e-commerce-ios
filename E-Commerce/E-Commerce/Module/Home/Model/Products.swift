//
//  Products.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 10/10/23.
//

// MARK: - Datum
struct ProductData: Codable {
    let categoryName: String?
    let categoryData: [CategoryData]?
}

// MARK: - CategoryDatum
struct CategoryData: Codable {
    let _id, sName: String?
    let iSellerId: String?
    let sCategory: String?
    let sBrandName: String?
    let dPrice: Double?
    let sDescription: String?
    let sImage: String?

}
