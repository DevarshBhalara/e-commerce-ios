//
//  Categories.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 10/10/23.
//

import Foundation
import UIKit

struct CategoryModel {
    let image: UIImage
    let title: String
}

struct Category {
    static func getAllCategory() -> [CategoryModel] {
        return [
            CategoryModel(image: UIImage(named: "mobile")!, title: "Mobile"),
            CategoryModel(image: UIImage(named: "laptop")!, title: "Laptop"),
            CategoryModel(image: UIImage(named: "jewellery")!, title: "Jewellery"),
            CategoryModel(image: UIImage(named: "mobile")!, title: "Mobile"),
            CategoryModel(image: UIImage(named: "laptop")!, title: "Laptop"),
        ]
    }
    
    static func getAllCategorySeller() -> [CategoryModel] {
        return [
            CategoryModel(image: UIImage(named: "mobile")!, title: "All"),
            CategoryModel(image: UIImage(named: "mobile")!, title: "Mobile"),
            CategoryModel(image: UIImage(named: "laptop")!, title: "Laptop"),
            CategoryModel(image: UIImage(named: "jewellery")!, title: "Jewellery"),
            CategoryModel(image: UIImage(named: "mobile")!, title: "Mobile"),
            CategoryModel(image: UIImage(named: "laptop")!, title: "Laptop"),
        ]
    }
}
