//
//  HomeViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 5/8/2023.
//

import UIKit

class HomeViewController: UIViewController {

    var categories : [Category] = []
    var bestSelling: [Product] = []
    
    @IBOutlet weak var categoriesCV: UICollectionView!
    
    @IBOutlet weak var bestSellingCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        registerViewCells()
        
        initCategories()
        initBestSelling()
        
       
        
    }
    
    func registerViewCells() {
        categoriesCV.register(UINib(nibName: "CategoryViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryViewCell")
        bestSellingCV.register(UINib(nibName: "BestSellingViewCell", bundle: nil), forCellWithReuseIdentifier: "BestSellingViewCell")
    }
    
    
    func initCategories() {
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
    
    
    func initBestSelling() {
        bestSelling = [
                Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://store.sony.com.au/dw/image/v2/ABBC_PRD/on/demandware.static/-/Sites-sony-master-catalog/default/dwa71c960c/images/SRSXB13B/SRSXB13B.png"),
                Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
                Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://www.philips.co.in/c-dam/b2c/category-pages/sound-and-vision/portable-audio/in/wireless-speakers/TAS1505B-hero-product-image.jpg"),
                Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
        ]
        bestSellingCV.reloadData()
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

 


extension HomeViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (collectionView) {
        case categoriesCV : return categories.count
        case bestSellingCV: return bestSelling.count
        default:
            return 0
        }
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (collectionView) {
        case categoriesCV :
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryViewCell", for: indexPath) as! CategoryViewCell
            viewCell.set(categories[indexPath.row])
            return viewCell
        case bestSellingCV:
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellingViewCell", for: indexPath) as! BestSellingViewCell
            viewCell.set(bestSelling[indexPath.row])
            return viewCell
        
        default:
            return UICollectionViewCell()
        }
        
    }
    
}
