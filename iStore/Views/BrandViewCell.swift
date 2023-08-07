//
//  BrandViewCell.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 7/8/2023.
//

import UIKit

class BrandViewCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var productsCount: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        _applyStyles()
    }
    
    
    func set(_ brand: Brand) {
        label.text = brand.label
        productsCount.text = "\(brand.productsCount) products"
        logo.download(from: brand.logoURL)
    }
    
    private func _applyStyles() {
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: 0, height: 0)
        container.layer.shadowRadius = 6.0
        container.layer.shadowColor = UIColor.darkGray.cgColor
        container.layer.cornerRadius = 8
    }

}
