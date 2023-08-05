//
//  HomeViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 5/8/2023.
//

import UIKit

class HomeViewController: UIViewController {

    var categories : [Category] = []
    
    @IBOutlet weak var categoriesCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoriesCV.register(UINib(nibName: "CategoryViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryViewCell")
        
        categories = [
            Category(label: "Hello", icon:"https://cdn-icons-png.flaticon.com/512/4804/4804045.png"),
            Category(label: "World", icon:"https://cdn-icons-png.flaticon.com/512/4804/4804045.png"),
            Category(label: "World", icon:"https://cdn-icons-png.flaticon.com/512/4804/4804045.png"),
            Category(label: "World", icon:"https://cdn-icons-png.flaticon.com/512/4804/4804045.png"),
            Category(label: "World", icon:"httpDs://cdn-icons-png.flaticon.com/512/4804/4804045.png"),
            Category(label: "Hello", icon:"https://cdn-icons-png.flaticon.com/512/4804/4804045.png"),
            Category(label: "World", icon:"https://cdn-icons-png.flaticon.com/512/4804/4804045.png"),
            Category(label: "Hello", icon:"https://cdn-icons-png.flaticon.com/512/4804/4804045.png"),
            Category(label: "World", icon:"https://cdn-icons-png.flaticon.com/512/4804/4804045.png"),
        ]
        categoriesCV.reloadData()
        
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


struct Category {
 let label: String
    let icon: String
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = categories[indexPath.row]
        let categoryViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryViewCell", for: indexPath) as! CategoryViewCell
        categoryViewCell.setLabel(label: item.label)
        categoryViewCell.setIcon(url: item.icon)
        return categoryViewCell
    }
    
    
    
    
    
}

