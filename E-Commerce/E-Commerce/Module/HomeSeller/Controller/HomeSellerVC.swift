//
//  HomeSellerVC.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 19/10/23.
//

import UIKit

class HomeSellerVC: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    @IBOutlet weak var lblNoProduct: UILabel!
    @IBOutlet weak var clvCategory: UICollectionView!
    @IBOutlet weak var tblHome: UITableView!
    
    // MARK: - Variables
    let category = Category.getAllCategorySeller()
    var homeSellerCoordinator: HomeSellerCoordinator?
    private let viewModel = HomeSellerViewModel()
    private var products: [CategoryData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindObservable()
    }
    
    private func setupUI() {
        
    }
    
    @IBAction func actionGotoAddProduct(_ sender: UIButton) {
        homeSellerCoordinator?.gotoAddProduct()
    }
    
    
    private func bindObservable() {
        viewModel.products.bind { [weak self] prodcuts in
            guard let self = self else {
                return
            }
            if prodcuts.isEmpty {
                self.lblNoProduct.isHidden = false
                self.tblHome.isScrollEnabled = false
            } else {
                self.products = prodcuts
                self.tblHome.reloadData()
            }
        }
    }
}

// MARK: - Extension collection view datasource
extension HomeSellerVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorySellerCVCell", for: indexPath) as? CategorySellerCVCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(data: category[indexPath.row])
        return cell
    }
}

//MARK: Collection View flow delegate
extension HomeSellerVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.size.width / 3, height: view.bounds.size.height / 7)
        
    }
}

// MARK: - Tableview Datasource
extension HomeSellerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSellerProductTableCell", for: indexPath) as? HomeSellerProductTableCell else {
            return UITableViewCell()
        }
        cell.configureCell(data: products[indexPath.row])
        return cell
    }
}

// MARK: - Tableview delegate
extension HomeSellerVC: UITableViewDelegate {
    
}

