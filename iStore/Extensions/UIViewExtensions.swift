//
//  UIViewExtensions.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 15/8/2023.
//

import UIKit

extension UIView {
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}
