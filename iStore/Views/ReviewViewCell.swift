//
//  ReviewViewCell.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 22/8/2023.
//

import UIKit

class ReviewViewCell: UITableViewCell {

    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var ratingContainer: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(_ review: Review) {
        ratingContainer.arrangedSubviews.forEach { view in
            ratingContainer.removeArrangedSubview(view)
        }
        userLabel.text = review.user
        commentLabel.text = review.comment
        for i in 1...5 {
            let color = i<=review.rating ? UIColor.systemYellow : UIColor.systemGray5
            let star = UIImage(systemName: "star.fill")
            let view = UIImageView(image:star?.withTintColor(color, renderingMode: .alwaysOriginal))
            //view.translatesAutoresizingMaskIntoConstraints = false
            ratingContainer.addArrangedSubview(view)
        }
        
    }
    
}
