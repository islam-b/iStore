//
//  BrandViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 8/8/2023.
//

import UIKit

class BrandViewController: UIViewController {


    @IBOutlet weak var searchBtn: UIBarButtonItem!
    
    @IBOutlet weak var productsCV: UICollectionView!
    
    var brand: Brand?
    
    var products : [Product] = [
        Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://store.sony.com.au/dw/image/v2/ABBC_PRD/on/demandware.static/-/Sites-sony-master-catalog/default/dwa71c960c/images/SRSXB13B/SRSXB13B.png"),
        Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
        Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://www.philips.co.in/c-dam/b2c/category-pages/sound-and-vision/portable-audio/in/wireless-speakers/TAS1505B-hero-product-image.jpg"),
        Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
        Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://www.philips.co.in/c-dam/b2c/category-pages/sound-and-vision/portable-audio/in/wireless-speakers/TAS1505B-hero-product-image.jpg"),
        Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
    ]
    
    var subCategories : [Category] = [
        Category(id: 1, label: "All", iconUrl: ""),
        Category(id: 1, label: "Headphones", iconUrl: ""),
        Category(id: 1, label: "Speakers", iconUrl: ""),
        Category(id: 1, label: "Microphones", iconUrl: "")


    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = brand?.label
        _registerViews()
        _applyStyles()
        
    }
    
    private func _registerViews() {
        productsCV.register(UINib(nibName: "BestSellingViewCell", bundle: nil), forCellWithReuseIdentifier: "BestSellingViewCell")
        productsCV.register(UINib(nibName: "SubCategoriesCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SubCategoriesCollectionReusableView")
    }
    
    private func _applyStyles() {
        let searchBtnView = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        searchBtnView.setTitle("", for: .normal)
        searchBtnView.backgroundColor = UIColor.systemBlue
        searchBtnView.layer.cornerRadius = 18.0
        searchBtnView.layer.masksToBounds = true
        searchBtnView.tintColor = UIColor.white
        searchBtnView.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchBtnView.addTarget(self, action: #selector(onSearch), for: .touchUpInside)
        searchBtn.customView = searchBtnView
    }
    
    @objc func onSearch() {
        let searchVC = storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        searchVC.modalPresentationStyle  = .fullScreen
        searchVC.modalTransitionStyle = .crossDissolve
        present(searchVC, animated: true)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if (segue.identifier == "ProductSegue") {
             let vc = segue.destination as! ProductViewController
             vc.product = sender as! Product
         }
     }

}


extension BrandViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: getCellWidth(), height: getCellHeight())
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellingViewCell", for: indexPath) as! BestSellingViewCell
        cell.set(products[indexPath.row])
        cell.width.constant = getCellWidth()
        cell.height.constant = getCellHeight()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        performSegue(withIdentifier: "ProductSegue", sender: product)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SubCategoriesCollectionReusableView", for: indexPath) as! SubCategoriesCollectionReusableView
            header.set(subcategories: subCategories)
            return header
        } else {
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60.0)
    }
    
    func getRowCount() -> Int {
        return 2
    }
    
    func getCellWidth() -> CGFloat {
        let rowCount = Float(getRowCount())
        let screenWidth = Float(UIScreen.main.bounds.width)
        let spacing = (rowCount - 1.0) * 0.0 + 2 * 8.0
        let width = (screenWidth - spacing) / rowCount
        return CGFloat(width)
    }
    
    func getCellHeight() -> CGFloat {
        return 300.0
    }
    
    
}
