//
//  HomeViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 5/8/2023.
//

import UIKit

class HomeViewController: UIViewController, CategoryServiceDelegate {
 

    
    var categoryService = CategoryService()
    
    var categories : PagedResult<Category>?
    var bestSelling: [Product] = []
    
    @IBOutlet weak var categoriesCV: UICollectionView!
    @IBOutlet weak var categoriesLoading: UIActivityIndicatorView!
    
    @IBOutlet weak var bestSellingCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        registerViews()
        
        categoryService.delegate = self
        fetchCategories()
        
        initBestSelling()
        

    }
    
    func fetchCategories() {
        categoriesLoading.startAnimating()
        categoryService.fetchCategories()
    }
    
    
    func handleError(_ error: Error) {
        var alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        DispatchQueue.main.async() {
            self.present(alert, animated: true)
        }
        
    }
    
    func onCategoriesReceived(_ page: PagedResult<Category>) {
        DispatchQueue.main.async() {
            self.categoriesLoading.stopAnimating()
            self.categories = page
            self.categoriesCV.reloadData()
        }
    }
    
    
    func registerViews() {
        categoriesCV.register(UINib(nibName: "CategoryViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryViewCell")
        bestSellingCV.register(UINib(nibName: "BestSellingViewCell", bundle: nil), forCellWithReuseIdentifier: "BestSellingViewCell")
    }
    
    
    
    func initBestSelling() {
        bestSelling = [
                Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://store.sony.com.au/dw/image/v2/ABBC_PRD/on/demandware.static/-/Sites-sony-master-catalog/default/dwa71c960c/images/SRSXB13B/SRSXB13B.png"),
                Product(label: "Tennis Balls", brand: "Wilson", priceUSD: 755, imageUrl: "https://nwscdn.com/media/catalog/product/c/l/classic-tour-tennis-balls.jpg"),
                
                Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
                Product(label: "BeoPlay Speaker", brand: "Band and Olufsen", priceUSD: 755, imageUrl: "https://www.philips.co.in/c-dam/b2c/category-pages/sound-and-vision/portable-audio/in/wireless-speakers/TAS1505B-hero-product-image.jpg"),
                Product(label: "Leather Wristwatch", brand: "Tag Heure", priceUSD: 450, imageUrl: "https://cdn.shopify.com/s/files/1/0304/3821/products/Currensmartwatch218.jpg?v=1655203460"),
        ]
        bestSellingCV.reloadData()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "CategorySegue") {
            let vc = segue.destination as! CategoryViewController
            vc.categoryItem = sender as! Category
        } else if (segue.identifier == "ProductSegue") {
            let vc = segue.destination as! ProductViewController
            vc.product = sender as! Product
        }
    }
    
    
    @IBAction func onCameraOpen(_ sender: Any) {
//        let cameraVC = UIImagePickerController()
//        cameraVC.sourceType = UIImagePickerController.SourceType.camera
//        present(cameraVC, animated: true, completion: nil)
    }
    
}

 


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (collectionView) {
        case categoriesCV : return categories?.totalCount ?? 0
        case bestSellingCV: return bestSelling.count
        default:
            return 0
        }
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (collectionView) {
        case categoriesCV :
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryViewCell", for: indexPath) as! CategoryViewCell
            viewCell.set((categories?.items[indexPath.row])!)
            return viewCell
        case bestSellingCV:
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellingViewCell", for: indexPath) as! BestSellingViewCell
            viewCell.set(bestSelling[indexPath.row])
            return viewCell
        
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.layer.opacity = 0.5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.layer.opacity = 1.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (collectionView) {
        case categoriesCV :
            let category = categories?.items[indexPath.row]
            performSegue(withIdentifier: "CategorySegue", sender: category)
        case bestSellingCV:
            let product = bestSelling[indexPath.row]
            performSegue(withIdentifier: "ProductSegue", sender: product)
        default:
            print("nothing")
        }
    }
    
}
