//
//  ProductsTableViewCell.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

import UIKit

protocol SeeAllClick: AnyObject {
    func goToSeeAllPage(name: String)
}

class ProductsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var clvProducts: UICollectionView!
    @IBOutlet weak var clvProductHeight: NSLayoutConstraint!
    
    //MARK: - Variables
    let viewModel = HomeViewModel()
    var delegate: SeeAllClick?
    private var contentSizeObservation: NSKeyValueObservation?
    var allProduct: [ProductData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clvProducts.dataSource = self
        clvProducts.delegate = self
        
        clvProducts.register(UINib(nibName: "ProductCollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProductCollectionViewHeader")
        
        contentSizeObservation = clvProducts.observe(\.contentSize, options: .new, changeHandler: { [weak self] (tv, _) in
            
            guard let self = self else { return }
            
            self.clvProductHeight.constant = tv.contentSize.height
            self.contentView.layoutSubviews()
            self.contentView.layoutIfNeeded()
        })
        self.clvProducts.addObserver(self, forKeyPath: "contentSize", options:   NSKeyValueObservingOptions.old.union(NSKeyValueObservingOptions.new), context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        self.clvProductHeight.constant = self.clvProducts.contentSize.height
        
    }
    
    func configureCell(data: [ProductData]) {
        self.allProduct = data
        self.clvProducts.reloadData()
    }

}

//MARK: collection view datasource
extension ProductsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        allProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allProduct[section].categoryData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let data = allProduct[indexPath.section].categoryData?[indexPath.row] {
            cell.configureCell(data: data)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProductCollectionViewHeader", for: indexPath) as? ProductCollectionViewHeader else {
            return UICollectionReusableView()
        }
        
        headerView.configureHeader(data: allProduct[indexPath.section].categoryName ?? "N/A")
        headerView.btnSeeAll.tag = indexPath.section
        headerView.btnSeeAll.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        return headerView
    }
    
}

//MARK: - Collection View delegate layout
extension ProductsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 2 - 10, height: UIScreen.main.bounds.height / 4)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }

}

// MARK: - SeeAll Protocol
extension ProductsTableViewCell {
    @objc func seeAllButtonTapped(row sender: UIButton) {
        self.delegate?.goToSeeAllPage(name: self.allProduct[sender.tag].categoryName ?? "")
    }
    
}
