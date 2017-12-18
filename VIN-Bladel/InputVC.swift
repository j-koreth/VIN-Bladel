//
//  InputVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 12/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class InputVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var vinTextfield: UITextField!
    
    var barcode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        searchButton.isEnabled = false
        searchButton.backgroundColor = UIColor.clear
        

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        if vinTextfield.text!.count >= 17
        {
            barcode = vinTextfield.text!
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if vinTextfield.text!.count >= 17
        {
            searchButton.isEnabled = true
            
        }
    }


}
