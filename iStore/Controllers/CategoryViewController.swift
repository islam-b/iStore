//
//  CategoryViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 7/8/2023.
//

import UIKit

class CategoryViewController: UIViewController {

    var categoryItem: Category? = nil
    
    var products : [Product] = [
        Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://store.sony.com.au/dw/image/v2/ABBC_PRD/on/demandware.static/-/Sites-sony-master-catalog/default/dwa71c960c/images/SRSXB13B/SRSXB13B.png"),
        Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
        Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://www.philips.co.in/c-dam/b2c/category-pages/sound-and-vision/portable-audio/in/wireless-speakers/TAS1505B-hero-product-image.jpg"),
        Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
        Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://www.philips.co.in/c-dam/b2c/category-pages/sound-and-vision/portable-audio/in/wireless-speakers/TAS1505B-hero-product-image.jpg"),
        Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
    ]
    
    var brands : [Brand] = [
        Brand(logoURL: "https://upload.wikimedia.org/wikipedia/commons/a/ab/Apple-logo.png", label: "Apple", productsCount: 60),
        Brand(logoURL: "https://brandslogos.com/wp-content/uploads/images/large/adidas-logo.png", label: "Adidas", productsCount: 120),
        Brand(logoURL: "https://upload.wikimedia.org/wikipedia/commons/a/ab/Apple-logo.png", label: "Apple", productsCount: 60),
        Brand(logoURL: "https://brandslogos.com/wp-content/uploads/images/large/adidas-logo.png", label: "Adidas", productsCount: 120),
    ]
    
    @IBOutlet weak var searchBtn: UIBarButtonItem!
    
    @IBOutlet weak var productsCV: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _registerViews()
        _applyStyles()
        title = categoryItem?.label
    }
    
    private func _registerViews() {
        productsCV.register(UINib(nibName: "BestSellingViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductViewCell")
        productsCV.register(UINib(nibName: "BrandsHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "BrandsHeader")
    }

    
    // MARK: - Navigation
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "BrandSegue") {
            let brand = sender as! Brand
            let brandVC = segue.destination as! BrandViewController
            brandVC.brand = brand
        }else if (segue.identifier == "ProductSegue") {
            let vc = segue.destination as! ProductViewController
            vc.product = sender as! Product
        }
    }
    
    
    // MARK: - Styles

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

}


extension CategoryViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: getCellWidth(), height: getCellHeight())
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductViewCell", for: indexPath) as! BestSellingViewCell
        cell.set(products[indexPath.row])
        cell.width.constant = getCellWidth()
        cell.height.constant = getCellHeight()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "BrandsHeader", for: indexPath) as! BrandsHeader
            headerView.loadData(brands: brands)
            headerView.delegate = self
            return headerView
        } else {
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        performSegue(withIdentifier: "ProductSegue", sender: product)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 140.0)
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


extension CategoryViewController : BrandsHeaderDelegate {
    
    func onSelectBrand(brand: Brand) {
        performSegue(withIdentifier: "BrandSegue", sender: brand)
    }
    
}
