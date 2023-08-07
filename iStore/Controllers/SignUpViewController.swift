//
//  SignUpViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 5/8/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var container: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        applyStyles()
    }
    
    func applyStyles() {
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: 3, height: 3)
        container.layer.shadowRadius = 8.0
        container.layer.shadowColor = UIColor.darkGray.cgColor
        
        container.layer.cornerRadius = 16
        
        container.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24 ,right: 24)
        container.isLayoutMarginsRelativeArrangement = true
    }
    
    @IBAction func onSignUp(_ sender: Any) {
       // let accountVerificationVC = storyboard?.instantiateViewController(withIdentifier: "AccountVerificationViewController") as! AccountVerificationViewController
        //self.navigationController?.pushViewController(accountVerificationVC, animated: true)
        performSegue(withIdentifier: "VerificationSegue", sender: nil)
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
