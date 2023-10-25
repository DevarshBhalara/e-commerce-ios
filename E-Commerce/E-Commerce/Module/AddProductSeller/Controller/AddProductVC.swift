//
//  AddProductVC.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 24/10/23.
//

import UIKit
import Kingfisher

class AddProductVC: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfBrandName: UITextField!
    @IBOutlet weak var btnAddImage: UIButton!
    @IBOutlet weak var tfCategory: UITextField!
    @IBOutlet weak var btnAddProduct: UIButton!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var tvDescription: UITextView!

    
    //MARK: - Variables
    var addProdctCoordinator: AddProductCoordinator?
    var imageUrl = ""
    private var category = ["Mobile", "Laptop", "Jewellary", "Fashion"]
    private var categoryPicker = UIPickerView()
    private let viewModel = AddProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindObservable()
    }
    
    private func setupUI() {
        categoryPicker.delegate = self
        tfCategory.delegate = self
        tfCategory.inputView = categoryPicker
    }
   
    
    private func bindObservable() {
        viewModel.imageUrl.bind { [weak self] imgUrl in
            guard let self = self else {
                return
            }
            self.imageUrl = imgUrl
            self.imgProduct.kf.setImage(with: URL(string: imgUrl))
            viewModel.validData(imgUrl: imageUrl, name: tfName.text ?? "", description: tvDescription.text ?? "", category: tfCategory.text ?? "", price: Float(tfPrice.text ?? "-1") ?? -1, brandName: tfBrandName.text ?? "")
        }
        
        viewModel.error.bind { [weak self] error in
            
            self?.btnAddProduct.configuration?.showsActivityIndicator = false
            self?.showAlert(title: error)
        }
        
        viewModel.validationError.bind { [weak self] error in
            self?.btnAddProduct.configuration?.showsActivityIndicator = false
            self?.showAlert(title: error)
        }
        
        viewModel.success.bind { [weak self] sucess in
            self?.btnAddProduct.configuration?.showsActivityIndicator = false
            self?.showAlert(title: sucess) {
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func actionAddProduct(_ sender: UIButton) {
        if let image = imgProduct.image {
            btnAddProduct.configuration?.showsActivityIndicator = true
            viewModel.uploadImage(image: image)
            
        } else {
            showAlert(title: "Please Add Image.")
        }
    }
    
    @IBAction func actionAddImage(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true)
    }
}

// MARK: - Image Picker delegate
extension AddProductVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] else {
            self.btnAddImage.configuration?.showsActivityIndicator = false
            return
        }
        let imageProduct = image as? UIImage
        
        if let imageProduct = imageProduct {
            self.imgProduct.image = imageProduct
        }
        self.dismiss(animated: true)
    }
    
}

// MARK: - Category Picker
extension AddProductVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tfCategory.text = category[row]
    }
    
}

// MARK: - Textfield delegate
extension AddProductVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfCategory {
            return false
        }
        return true
    }
}
