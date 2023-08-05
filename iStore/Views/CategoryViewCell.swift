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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLabel(label:String) {
        self.label.text = label
    }

    func setIcon(url:String) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response , error in
            if (data != nil) {
                DispatchQueue.main.async() {
                            self.icon.image = UIImage(data: data!)
                        }
            } else {
                DispatchQueue.main.async() {
                    self.icon.image = #imageLiteral(resourceName: "CategoryPlaceholder")

                        }
            }
        }.resume()
    }

}
