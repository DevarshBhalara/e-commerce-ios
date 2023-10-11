//
//  SignUp.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

struct SignUpRequest: Codable {
    let sUsername, sPassword, sEmail: String?
    let nMobile: String?
    let eRole: String?
    
    func requestParameter() -> [String: Any] {
        var param: [String: Any] = [:]
        param["sUsername"] = sUsername
        param["sPassword"] = sPassword
        param["sEmail"] = sEmail
        param["nMobile"] = nMobile
        param["eRole"] = eRole
        return param
    }
}

struct SignUpResponse: Codable {
    let id: String?
}
