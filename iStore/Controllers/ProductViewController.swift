//
//  ProductViewController.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 13/8/2023.
//

import UIKit

class ProductViewController: UIViewController {

    var product: Product?
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    @IBOutlet weak var sizeField: UITextField!
    
    @IBOutlet weak var sizeSelector: UIStackView!
    
    @IBOutlet weak var colorSelector: UIStackView!
    
    @IBOutlet weak var size: UILabel!
    
    @IBOutlet weak var color: UILabel!
    
    @IBOutlet weak var colorField: UITextField!
    
    var sizes = ["L", "XL", "XXl"]
    var colors = [UIColor.blue, UIColor.red, UIColor.white]
    var sizePicker = UIPickerView()
    var colorPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        label.text = product?.label
        descriptionLabel.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
        let imageUrl = (product?.imageUrl)!
        image.download(from: imageUrl)
        
        color.backgroundColor = colors[0]
        size.text = sizes[0]
        
        _applyStyles()
        _initSizePicker()
        _initColorPicker()
        
        sizePicker.selectRow(0, inComponent: 0, animated: true)
        colorPicker.selectRow(0, inComponent: 0, animated: true)
    }
    
    private func _initSizePicker() {
        
        //  set the pickers datasource and delegate
        sizePicker.delegate = self
        sizePicker.dataSource = self

        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.systemBlue
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePicker))

        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        sizeField.inputView = sizePicker
        sizeField.inputAccessoryView = toolBar
    }
    
    private func _initColorPicker() {
        
        //  set the pickers datasource and delegate
        colorPicker.delegate = self
        colorPicker.dataSource = self

        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.systemBlue
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePicker))

        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        colorField.inputView = colorPicker
        colorField.inputAccessoryView = toolBar
    }
    
    
    
    @objc func donePicker() {
        sizeField.resignFirstResponder()
        colorField.resignFirstResponder()
    }
    
    
    
    

    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func _applyStyles() {
        navBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        sizeSelector.layer.borderWidth = 1
        sizeSelector.layer.borderColor = UIColor.systemGray5.cgColor
        sizeSelector.layer.cornerRadius = 20
        sizeSelector.addGestureRecognizer( UITapGestureRecognizer(target: self, action: #selector(self.openSizePicker)))
        
        colorSelector.layer.borderWidth = 1
        colorSelector.layer.borderColor = UIColor.systemGray5.cgColor
        colorSelector.layer.cornerRadius = 20
        colorSelector.addGestureRecognizer( UITapGestureRecognizer(target: self, action: #selector(self.openColorPicker)))
        
        color.layer.masksToBounds = true
        color.layer.cornerRadius = 8
        
        
    }

    
    @objc func openSizePicker() {
        sizeSelector.alpha = 0.25
        UIView.animate(withDuration: 0.5) {
            self.sizeSelector.alpha = 1.0
        }
        sizeField.becomeFirstResponder()
    }
    
    @objc func openColorPicker() {
        colorSelector.alpha = 0.25
        UIView.animate(withDuration: 0.5) {
            self.colorSelector.alpha = 1.0
        }
        colorField.becomeFirstResponder()
    }
    
}


extension ProductViewController:  UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == sizePicker) {
            return sizes.count
        } else if (pickerView == colorPicker) {
            return colors.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == sizePicker) {
            return sizes[row]
        } else if (pickerView == colorPicker) {
            return String(describing: colors[row])
        } else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let colorItemView : ColorItemView = UIView.fromNib()
        if (pickerView == colorPicker) {
            colorItemView.color.backgroundColor = colors[row]
            colorItemView.label.text = String(describing: colors[row])
        } else  if (pickerView == sizePicker ) {
            colorItemView.color.backgroundColor = UIColor.clear
            colorItemView.label.text = sizes[row]
        }
        return colorItemView
    }
     
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView == sizePicker) {
            size.text = sizes[row]
        } else if (pickerView == colorPicker) {
            color.backgroundColor = colors[row]
        }
    }
    
    
}
