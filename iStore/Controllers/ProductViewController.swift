//
//  ProductViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 13/8/2023.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var backBtn: UIBarButtonItem!
    
    
    @IBOutlet weak var favBtn: UIBarButtonItem!
    
    var product : Product?
    var reviews: [Review] = [
        Review(user: "Mohamed Islam", comment: "test test test testtesttesttesttesttesttest testtesttest test test", rating: 5),
        Review(user: "Mohamed Islam", comment: "test", rating: 3),
        Review(user: "Mohamed Islam", comment: "test", rating: 4),
        Review(user: "Mohamed Islam", comment: "test", rating: 3)
    ]
    
    
    @IBOutlet weak var navBar: UINavigationBar!


    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _applyStyles()
        
        
        tableView.register(UINib(nibName: "ProductInfo", bundle: nil), forHeaderFooterViewReuseIdentifier: "ProductInfo")
        tableView.register(UINib(nibName: "ReviewViewCell", bundle: nil), forCellReuseIdentifier: "ReviewViewCell")
        tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
        
    
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "WriteReviewSegue") {
            let vc = segue.destination as! WriteReviewViewController
            
            vc.product = self.product
        }
    }
    
    
    private func _applyStyles() {
        navBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        let backBtnView = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        backBtnView.setTitle("", for: .normal)
        backBtnView.backgroundColor = UIColor.white
        backBtnView.layer.cornerRadius = 16.0
        backBtnView.layer.masksToBounds = true
        backBtnView.tintColor = UIColor.systemBlue
        backBtnView.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtnView.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        backBtn.customView = backBtnView
        
        let favBtnView = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        favBtnView.setTitle("", for: .normal)
        favBtnView.backgroundColor = UIColor.white
        favBtnView.layer.cornerRadius = 16.0
        favBtnView.layer.masksToBounds = true
        favBtnView.tintColor = UIColor.systemBlue
        favBtnView.setImage(UIImage(systemName: "star"), for: .normal)
//        favBtnView.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        favBtn.customView = favBtnView
    }
    
    @objc func onBack() {
        dismiss(animated: true)
    }
    
    
    
    
}


extension ProductViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ReviewViewCell", for: indexPath) as! ReviewViewCell
        cell.set(reviews[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProductInfo") as! ProductInfo
        header.set(self.product)
        header.delegate = self
        header.sizeToFit()
        return header
    }
    
     
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var header = self.tableView(tableView, viewForHeaderInSection: section) as! ProductInfo
        return header.height
    }
    
    
    
    
    
}


extension ProductViewController: ProductInfoDelegate {
    func onWriteReview() {
        performSegue(withIdentifier: "WriteReviewSegue", sender: nil)
    }
    
}
