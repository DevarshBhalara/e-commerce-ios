//
//  LoginViewModel.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 23/08/23.
//

import Foundation
class LoginViewModel {
    
    // MARK: - variable
    var loginSuccess = Dynamic<LoginResponse?>(nil)
    var loginError = Dynamic<CustomError?>(nil)
    var validationError = Dynamic<String>("")
    
    func validateInput(email: String, password: String) {
        if email.isEmpty {
            validationError.value = "Please enter Email!"
        } else if password.isEmpty {
            validationError.value = "Please enter Password"
        } else {
            callLoginApi(loginRequest: LoginRequest(email: email, password: password))
        }
    }
    
    private func callLoginApi(loginRequest: LoginRequest) {
        let param = loginRequest.getRequestParams()
        APIManager.shared.call(type: .login, params: param) { [weak self] (result: Result<LoginResponse, CustomError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let loginResponse):
                KeychainHelper.shared.accessToken = loginResponse.sToken
                KeychainHelper.shared.role = loginResponse.eRole
                self.loginSuccess.value = loginResponse
            case .failure(let error):
                self.loginError.value = error
            }
        }
    }
}
