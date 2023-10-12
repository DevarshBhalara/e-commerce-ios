//
//  CategoryProductVC.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 12/10/23.
//

import UIKit

class CategoryProductVC: UIViewController, Storyboarded {
    
    //MARK: Outlets
    @IBOutlet weak var tblProducts: UITableView!

    //MARK: Variables
    var categoryProductCoordinator: CategoryProductCoordinator?
    var category: String?
    private let viewModel = CategoryProductViewModel()
    private var products: [CategoryData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindObservable()
    }
    
    private func setupUI() {
        if let category = category {
            viewModel.getCategoryProduct(category: category)
        }
    }
    
    private func bindObservable() {
        viewModel.products.bind { [weak self] products in
            guard let self = self else { return }
            self.products = products
            self.tblProducts.reloadData()
        }
    }
}

// MARK: - Table view datasource
extension CategoryProductVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryProductCellTableViewCell", for: indexPath) as? CategoryProductCellTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(data: products[indexPath.row])
        return cell
    }
}

// MARK: Table view delegate
extension CategoryProductVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.height / 3.5
    }
}
