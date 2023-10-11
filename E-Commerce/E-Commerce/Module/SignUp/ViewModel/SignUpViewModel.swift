//
//  SignUpViewModel.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

import Foundation
class SignUpViewModel {
    
    
    //MARK: variables
    var validationError = Dynamic<String>("")
    var success = Dynamic<SignUpResponse?>(nil)
    
    func validate(name: String, email: String, mobileNumber: String, role: String, password: String) {
        
        if (name.isEmpty) {
            validationError.value = "Please enter Name"
        } else if (email.isEmpty) {
            validationError.value = "Please enter Email"
        } else if (mobileNumber.isEmpty) {
            validationError.value = "Please enter Mobile Number"
        } else if (password.isEmpty) {
            validationError.value = "Please enter Password"
        } else {
            signUpApiCall(signUpRequest: SignUpRequest(sUsername: name, sPassword: password, sEmail: email, nMobile: mobileNumber, eRole: role))
        }
    }
    
    private func signUpApiCall(signUpRequest: SignUpRequest) {
        APIManager.shared.call(type: .signUp, params: signUpRequest.requestParameter()) { [weak self] (result: Result<SignUpResponse, CustomError>) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.success.value = response
            case .failure(let error):
                print(error)
            }
        }
    }
}
