//
//  BrandsHeader.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 7/8/2023.
//

import UIKit

class BrandsHeader: UICollectionReusableView {

    private var _brands : [Brand] = []
    
    var delegate: BrandsHeaderDelegate?
    
    @IBOutlet weak var brandsCV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        brandsCV.register(UINib(nibName: "BrandViewCell", bundle: nil), forCellWithReuseIdentifier: "BrandViewCell")
    }
    
    func loadData(brands : [Brand]) {
        _brands = brands
        brandsCV.reloadData()
    }
    
    
}


extension BrandsHeader : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let brand = _brands[indexPath.row]
        if (delegate != nil) {
            delegate?.onSelectBrand(brand: brand)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandViewCell", for: indexPath) as! BrandViewCell
        cell.set(_brands[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.layer.opacity = 0.5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.layer.opacity = 1.0
        }
    }
    
}


protocol BrandsHeaderDelegate {
    func onSelectBrand(brand: Brand) -> Void
}
