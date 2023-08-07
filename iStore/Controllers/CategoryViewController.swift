//
//  CategoryViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 7/8/2023.
//

import UIKit

class CategoryViewController: UIViewController {

    var categoryItem: Category? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = categoryItem?.label
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
