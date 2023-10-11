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
}

// MARK: Extensions
// MARK: EndPointType

extension RequestItemsType: EndPointType {
    
    // MARK: Vars & Lets
    
    var baseURL: String {
        
        switch self {
        case .login, .initialProducts, .signUp:
            return AppConstants.baseApi
        }
    }
    
    var version: String {
        switch self {
        case .login, .initialProducts, .signUp:
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
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .signUp:
            return .post
        case .initialProducts:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .initialProducts, .signUp:
            return ["Authorization" : KeychainHelper.shared.accessToken ?? ""]
        case .login:
            return []
        }
    }
    
    var url: URL {
        return URL(string: self.baseURL + self.version +  self.path)!
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
}

