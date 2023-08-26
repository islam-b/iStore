//
//  SubCategoriesCollectionReusableView.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 13/8/2023.
//

import UIKit

class SubCategoriesCollectionReusableView: UICollectionReusableView {

    static let identifier = String(describing: SubCategoriesCollectionReusableView.self)

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var subcategories:[Category] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(UINib(nibName: SubCategoryViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SubCategoryViewCell.identifier)
        collectionView.delegate = self
    }
    
    func set(subcategories: [Category]) {
        self.subcategories = subcategories
        collectionView.reloadData()
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
}


extension SubCategoriesCollectionReusableView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.subcategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubCategoryViewCell.identifier, for: indexPath) as! SubCategoryViewCell
        cell.set(category: subcategories[indexPath.row])
        if (cell.isSelected) {
            cell.select()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = self.collectionView(collectionView, cellForItemAt: indexPath) as! SubCategoryViewCell
        return CGSize(width: cell.label.frame.width+16, height: 60.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SubCategoryViewCell
        cell.select()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SubCategoryViewCell
        cell.deselect()
    }
    
}
