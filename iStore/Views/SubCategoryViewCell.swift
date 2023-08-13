//
//  SubCategoryViewCell.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 13/8/2023.
//

import UIKit

class SubCategoryViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(category: Category) {
        self.label.text = category.label
        self.label.sizeToFit()
    }
    
    func select() {
        self.label.textColor =  UIColor.black
    }
    
    func deselect() {
        self.label.textColor =  UIColor.systemGray2
    }

}
