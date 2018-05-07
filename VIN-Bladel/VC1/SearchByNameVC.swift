//
//  searchByNameVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class SearchByNameVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var extraLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        searchButton.isEnabled = false
        lastName.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        firstName.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func SearchButtonPressed(_ sender: UIButton)
    {
        if CustomerDatabase.getCustomerByName(first: firstName.text!, last: lastName.text!) != nil
        {
            customer = CustomerDatabase.getCustomerByName(first: firstName.text!, last: lastName.text!)
            self.performSegue(withIdentifier: "searchByNameToCars", sender: nil)
        }
            
        else
        {
            let alert = UIAlertController(title: "Error", message: "Customer was not found in the database", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    @objc func textFieldDidChange()
    {
        if firstName.text?.count != 0 && lastName.text?.count != 0
        {
            searchButton.isEnabled = true
            searchButton.backgroundColor = UIColor(red:0.71, green:0.76, blue:0.80, alpha:1.0)
            searchButton.setTitleColor(UIColor(red:0.71, green:0.76, blue:0.80, alpha:1.0), for: .disabled)
            searchButton.setTitleColor(UIColor.white, for: .normal)
            searchButton.layer.borderColor = UIColor(red:0.71, green:0.76, blue:0.80, alpha:1.0).cgColor
            searchButton.layer.borderWidth = 3
            searchButton.layer.cornerRadius = 35
        }
        else
        {
            searchButton.isEnabled = false
            searchButton.backgroundColor = UIColor.white
        }
    }
}
