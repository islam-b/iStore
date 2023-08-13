//
//  ProductViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 13/8/2023.
//

import UIKit

class ProductViewController: UIViewController {

    var product: Product?
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = product?.label
        let imageUrl = (product?.imageUrl)!
        image.download(from: imageUrl)
        
        navBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    

    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
