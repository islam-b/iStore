//
//  SignInViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 4/8/2023.
//

import UIKit

class SignInViewController: UIViewController, AuthServiceDelegate {
   

    var authService = AuthService()
    
    @IBOutlet weak var container: UIStackView!
    
    @IBOutlet weak var emailInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        applyStyles()
        authService.delegate = self
        
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
        if let email = emailInput.text, let password = passwordInput.text {
            signInBtn.isEnabled = false
            authService.signIn(username: email, password: password)
        }
    }
    
    func onUserAuthenticated(_ user: UserInfo) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navVC = storyboard.instantiateViewController(withIdentifier: "MainNavController") as! UINavigationController
        navVC.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.signInBtn.isEnabled = true
            self.present(navVC, animated: true)
        }
    }
    
    func handleError(_ error: Error) {
        var alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        DispatchQueue.main.async() {
            self.present(alert, animated: true)
        }
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
