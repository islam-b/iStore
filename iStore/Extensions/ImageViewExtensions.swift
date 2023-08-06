//
//  ImageViewExtensions.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 6/8/2023.
//

import UIKit


extension UIImageView {
    
    func download(from url: String, fallback: UIImage? = nil) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response , error in
            if (data != nil) {
                DispatchQueue.main.async() {
                    self.image = UIImage(data: data!)
                }
            } else if (fallback != nil) {
                DispatchQueue.main.async() {
                    self.image = fallback
                }
            }
        }.resume()
    }
}
