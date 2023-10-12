//
//  ApiManager+Request.swift
//  My Spotify
//
//  Created by Devarsh Bhalara on 04/07/23.
//

import Foundation
import Alamofire

enum RequestItemsType: Equatable {
    case login
    case initialProducts
    case signUp
    case categoryProduct(String)
}

// MARK: Extensions
// MARK: EndPointType

extension RequestItemsType: EndPointType {
    
    // MARK: Vars & Lets
    
    var baseURL: String {
        
        switch self {
        case .login, .initialProducts, .signUp, .categoryProduct:
            return AppConstants.baseApi
        }
    }
    
    var version: String {
        switch self {
        case .login, .initialProducts, .signUp, .categoryProduct:
            return AppConstants.apiVersion
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .initialProducts:
            return "get-product/"
        case .signUp:
            return "sign-up/"
        case .categoryProduct(let category):
            return "get-product?category=\(category)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .signUp:
            return .post
        case .initialProducts, .categoryProduct:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login:
            return [] 
        default:
            return ["Authorization" : KeychainHelper.shared.accessToken ?? ""]
        }
    }
    
    var url: URL {
        return URL(string: self.baseURL + self.version +  self.path)!
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
}

