//
//  Login.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 23/08/23.
//

struct LoginRequest {
    let email: String
    let password: String
    
    func getRequestParams() -> [String:Any] {
        var param: [String:Any] = [:]
        param["sEmail"] = email
        param["sPassword"] = password
        return param
    }
}

struct LoginResponse: Codable {
    let _id, sUsername, sEmail, nMobile, eRole, sToken: String
}

