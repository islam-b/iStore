//
//  CategoryViewCell.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 5/8/2023.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var iconContainer: UIView!
    
    override func awakeFromNib() {
         
        super.awakeFromNib()
        // Initialization code
        _applyStyles()
    }
   
    
    func set(_ category:Category) {
        self.label.text = category.label
        self.icon.download(from: category.icon, fallback: #imageLiteral(resourceName: "CategoryPlaceholder"))
    }

    
    private func _applyStyles() {
       
        iconContainer.layer.shadowOpacity = 0.1 
        iconContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        iconContainer.layer.shadowRadius = 4.0
        iconContainer.layer.shadowColor = UIColor.darkGray.cgColor
        iconContainer.layer.cornerRadius = 28
    }

}
