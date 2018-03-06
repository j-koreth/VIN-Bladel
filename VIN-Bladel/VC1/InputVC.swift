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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.backgroundColor = UIColor(red:0.20, green:0.62, blue:0.91, alpha:1.0)
        searchButton.backgroundColor = UIColor.lightGray
        searchButton.isEnabled = false
        
        vinTextfield.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }
    
    @objc func textFieldDidChange()
    {
        if vinTextfield.text?.count == 17
            {
                searchButton.backgroundColor = UIColor(red:0.51, green:0.77, blue:1.00, alpha:1.0)
                searchButton.isEnabled = true
    
            }
            else
            {
                searchButton.isEnabled = false
                searchButton.backgroundColor = UIColor.lightGray
            }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        car = VehicleDatabase.searchByVIN(vin: vinTextfield.text!)
    }

    @IBAction func searchVIN(_ sender: Any)
    {
        view.endEditing(true)

        if car?.fromDatabase == true
        {
            customer = CustomerDatabase.getCustomerByID(ID: (car?.vehicleCustomerID)!)
            self.performSegue(withIdentifier: "manualToCarInfo", sender: nil)
        }
        else {
            self.performSegue(withIdentifier: "inputNotFound", sender: nil)
        }
    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is DataNotFoundViewController
        {
            if(car?.error != nil) {
                let alert = UIAlertController(title: "Error", message: car?.error, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
