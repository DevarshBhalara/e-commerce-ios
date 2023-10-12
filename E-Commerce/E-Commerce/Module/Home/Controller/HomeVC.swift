//
//  HomeVC.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 10/10/23.
//

import UIKit

class HomeVC: UIViewController, Storyboarded, SeeAllClick {
    
    func goToSeeAllPage(name: String) {
        homeCoordinator?.gotoCategoryProducts(category: name)
    }
    

    //MARK: Outlets
    @IBOutlet weak var clvSlider: UICollectionView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var clvCategory: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    
    //MARK: Variables
    var homeCoordinator: HomeCoordinator?
    let viewModel = HomeViewModel()
    let category = Category.getAllCategory()
    let slider = Slider.getAllImage()
    var products: [ProductData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindObservable()
        
    }
    
    private func setupUI() {
        viewModel.getInitialProduct()
    }
    
    private func bindObservable() {
        viewModel.products.bind { [weak self] products in
            self?.products = products
            self?.tblView.reloadData()
        }
    }
    
    @IBAction func pageIndicatorAction(_ sender: UIPageControl) {
        clvSlider.scrollToItem(at: IndexPath(item: sender.currentPage, section: 0), at: .right, animated: true)
    }
    
}

// MARK: Collection view datasource

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView == clvCategory ? category.count : slider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == clvCategory {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as? CategoryCollectionCell else {
                return UICollectionViewCell()
            }
            cell.imgCategory.clipsToBounds = true
            cell.configureCell(data: category[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as? SliderCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(data: slider[indexPath.row])
            return cell
        }
    }
}

//MARK: - Collection View delegate
extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == clvSlider {
            pageIndicator.currentPage = indexPath.row
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == clvSlider {
            pageIndicator.currentPage = collectionView.indexPathsForVisibleItems[0].row
        }
    }
    
}

//MARK: Collection View flow delegate
extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == clvCategory {
            return CGSize(width: view.bounds.size.width / 3, height: view.bounds.size.height / 7)
        } else {
            return CGSize(width: view.bounds.size.width - 20, height: view.bounds.height / 3)
        }
    }
    
}

//MARK: Table view Datasource
extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as? ProductsTableViewCell else {
            return UITableViewCell()
        }
        cell.frame = tableView.bounds
        cell.delegate = self
        cell.clvProductHeight.constant = cell.clvProducts.collectionViewLayout.collectionViewContentSize.height
        cell.configureCell(data: products ?? [])
        cell.layoutIfNeeded()
        return cell
    }
}
