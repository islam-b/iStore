//
//  WriteReviewViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 23/8/2023.
//

import UIKit

class WriteReviewViewController: UIViewController, UITextViewDelegate {

    var product: Product?
    
    
 
    @IBOutlet var stars: [UIImageView]!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var commentField: UITextView!
    
    var rating:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        titleLabel.text = product?.label
        
        _applyStyles()
        
        for star in stars {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.starDidTap))
            star.addGestureRecognizer(tap)
        }
        
        commentField.text = "Tell us about your experience"


    }
    
    
    @objc func starDidTap(_ sender: UITapGestureRecognizer) {
        let star = sender.view as! UIImageView
        rating = star.tag
        _updateStars()
    }
    
    private func _updateStars() {
        for star in stars {
            if (star.tag<=rating) {
                star.image = UIImage(systemName: "star.fill")?.withTintColor(UIColor.systemYellow, renderingMode: .alwaysOriginal)
            } else {
                star.image = UIImage(systemName: "star")?.withTintColor(UIColor.systemGray4, renderingMode: .alwaysOriginal)
            }
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Tell us about your experience"
                textView.textColor = UIColor.lightGray
        }
    }
    
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
        {
            if(text == "\n")
            {
                view.endEditing(true)
                return false
            }
            else
            {
                return true
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func _applyStyles() {
        commentField.layer.borderColor = UIColor.systemGray5.cgColor
        commentField.layer.borderWidth = 1
        commentField.layer.cornerRadius = 8
        commentField.textColor = UIColor.lightGray
    }
    
    
     
}
