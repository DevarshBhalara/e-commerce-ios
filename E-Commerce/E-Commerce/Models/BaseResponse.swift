//
//  BaseResponse.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 23/08/23.
//

struct BaseResponse<T: Codable>: Codable {
    let success: Bool
    let message: String
    let data: T?
}
