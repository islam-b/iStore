//
//  ColorItemView.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 15/8/2023.
//

import UIKit

class ColorItemView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var color: UIView!
    
    
    /*
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        color.layer.cornerRadius = 8
    }

}
