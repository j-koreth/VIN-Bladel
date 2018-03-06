//
//  SearchCustomerViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 1/25/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class SearchCustomerViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    @IBOutlet weak var pulledText: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func search(_ sender: UIButton)
    {
        if CustomerDatabase.getCustomerByName(first: inputFirstName.text!, last: inputLastName.text!) != nil
        {
            customer = CustomerDatabase.getCustomerByName(first: inputFirstName.text!, last: inputLastName.text!)
            pulledText.text = (customer?.customerFirst)! + " " + (customer?.customerLast)!
            confirmButton.isEnabled = true
            car?.vehicleCustomerID = customer?.customerID

        }
        else
        {
            pulledText.text = "Customer not found. Try Again"
        }
    }
    
    
    @IBAction func confirm(_ sender: UIButton)
    {
        
        performSegue(withIdentifier: "searchCustomerToCarInfo", sender: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if inputLastName.text != "" && inputFirstName.text != "" 
        {
            searchButton.isEnabled = true
            searchButton.backgroundColor = UIColor(red:0.71, green:0.76, blue:0.80, alpha:1.0)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.isEnabled = false
        searchButton.setTitleColor(UIColor(red:0.71, green:0.76, blue:0.80, alpha:1.0), for: .disabled)
        searchButton.setTitleColor(UIColor.white, for: .normal)
        searchButton.layer.borderColor = UIColor(red:0.71, green:0.76, blue:0.80, alpha:1.0).cgColor
        searchButton.layer.borderWidth = 3
        searchButton.layer.cornerRadius = 35

        
        confirmButton.isEnabled = false
        confirmButton.setTitleColor(UIColor(red:0.31, green:0.63, blue:0.46, alpha:1.0), for: .disabled)
        confirmButton.setTitleColor(UIColor.white, for: .normal)
        confirmButton.layer.borderColor = UIColor(red:0.31, green:0.63, blue:0.46, alpha:1.0).cgColor
        confirmButton.layer.borderWidth = 3
        confirmButton.layer.cornerRadius = 35

        }
}
