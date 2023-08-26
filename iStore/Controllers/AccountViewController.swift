//
//  AccountViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 24/8/2023.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    

    @IBAction func orderHistorydidTap(_ sender: UIGestureRecognizer) {
        let view  = sender.view
        view?.alpha = 0.5
        UIView.animate(withDuration: 0.5) {
            view?.alpha = 1
        }
    }
    
    @IBAction func cardsDidTap(_ sender: UIGestureRecognizer) {
        let view  = sender.view
        view?.alpha = 0.5
        UIView.animate(withDuration: 0.5) {
            view?.alpha = 1
        }
        
        performSegue(withIdentifier: "CardsSegue", sender: nil)
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
