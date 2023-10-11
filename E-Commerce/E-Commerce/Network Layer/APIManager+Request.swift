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
}

// MARK: Extensions
// MARK: EndPointType

extension RequestItemsType: EndPointType {
    
    // MARK: Vars & Lets
    
    var baseURL: String {
        
        switch self {
        case .login, .initialProducts:
            return AppConstants.baseApi
        }
    }
    
    var version: String {
        switch self {
        case .login, .initialProducts:
            return AppConstants.apiVersion
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .initialProducts:
            return "get-product/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .initialProducts:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .initialProducts:
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

