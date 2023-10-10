//
//  AuthVC.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 21/08/23.
//

import UIKit

class AuthVC: UIViewController, Storyboarded {
    
    // MARK: - variables
    var authCoordinator: AuthCoordinator?
    let viewModel = LoginViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var tfEmail: TextFieldCustom!
    @IBOutlet weak var tfPassword: TextFieldCustom!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
        footerView.layer.cornerRadius = 10
    }
    
    private func bindViewModel() {
        
        viewModel.loginSuccess.bind { loginResponse in
            if let response = loginResponse {
                print(response)
            }
        }
        
        viewModel.loginError.bind { error in
            if let error = error {
                print(error.body)
            }
        }
        
        viewModel.validationError.bind { error in
            print(error)
        }
    }
    
    @IBAction func actionBtnLogin(_ sender: UIButton) {
        viewModel.validateInput(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
    }
}
