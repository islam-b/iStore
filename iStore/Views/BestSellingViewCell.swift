//
//  BestSellingViewCell.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 6/8/2023.
//

import UIKit

class BestSellingViewCell: UICollectionViewCell {

    @IBOutlet weak var imageContainer: UIView!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var brand: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    @IBOutlet weak var width: NSLayoutConstraint!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        _applyStyles()
    }
    
    func set(_ product: Product) {
        self.image.download(from: product.imageUrl)
        self.label.text = product.label
        self.brand.text = product.brand
        self.price.text = "$\(product.priceUSD)"
    }
    
    private func _applyStyles() {
        image.layer.cornerRadius = 10
        imageContainer.layer.cornerRadius = 8
        imageContainer.layer.borderWidth = 1
        imageContainer.layer.borderColor = UIColor.systemGray6.cgColor
    }

}
