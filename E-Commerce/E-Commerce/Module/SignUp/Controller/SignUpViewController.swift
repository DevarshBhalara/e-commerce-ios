//
//  SignUpViewController.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

import UIKit

class SignUpViewController: UIViewController, Storyboarded {
    
    //MARK: - Variables
    var signUpCoordinator: AuthCoordinator?
    let viewModel = SignUpViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var tfName: TextFieldCustom!
    @IBOutlet weak var tfMobileNumber: TextFieldCustom!
    @IBOutlet weak var radioBtnSeller: RadioButton!
    @IBOutlet weak var tfEmail: TextFieldCustom!
    @IBOutlet weak var radioBtnUser: RadioButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var tfPassword: TextFieldPassword!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindObservable()
    }
    
    private func bindObservable() {
        viewModel.success.bind { [weak self] response in
            
            guard let self = self else { return }
            self.btnSignUp.configuration?.showsActivityIndicator = false
            self.showAlert(title: "Registered Successfully! Please Login") {
                self.signUpCoordinator?.popToBack()
            }
        }
        
        viewModel.validationError.bind { [weak self] error in
            self?.btnSignUp.configuration?.showsActivityIndicator = false
            self?.showAlert(title: error)
        }
    }
    
    private func setupUI() {
        tfPassword.enablePasswordToggle()
    }
    
    @IBAction func actionBtnUser(_ sender: UIButton) {
        radioBtnSeller.isChecked = radioBtnUser.isChecked
    }
    
    
    @IBAction func actionBtnSeller(_ sender: UIButton) {
        radioBtnUser.isChecked = radioBtnSeller.isChecked
    }
    
    @IBAction func actionBtnSignUp(_ sender: UIButton) {
        btnSignUp.configuration?.showsActivityIndicator = true
        let role = radioBtnUser.isChecked ? "USER" : "SELLER"
        viewModel.validate(name: tfName.text ?? "", email: tfEmail.text ?? "", mobileNumber: tfMobileNumber.text ?? "", role: role, password: tfPassword.text ?? "")
    }
    
}
