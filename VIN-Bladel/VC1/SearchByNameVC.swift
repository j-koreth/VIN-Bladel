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
    @IBOutlet weak var buttonOutlet: UIButton!
    
    var customerToMaybeSend:CustomerData?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        buttonOutlet.isEnabled = false
        lastName.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        firstName.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    @IBAction func SearchButtonPressed(_ sender: UIButton)
    {
        customerToMaybeSend = CustomerDatabase.getCustomerByName(first: firstName.text!, last: lastName.text!)
        
        self.performSegue(withIdentifier: "searchByNameToCars", sender: nil)

    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    
    @objc func textFieldDidChange()
    {
        if firstName.text?.count != 0 && lastName.text?.count != 0
        {
            buttonOutlet.backgroundColor = UIColor(red:0.51, green:0.77, blue:1.00, alpha:1.0)
            buttonOutlet.titleLabel?.textColor = .white
            buttonOutlet.isEnabled = true
            
        }
        else
        {
            buttonOutlet.isEnabled = false
            buttonOutlet.backgroundColor = UIColor.white
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var newVC = segue.destination as! CustomerCarsVC
        newVC.carThatGotPassed = customerToMaybeSend
        
        
        
    }
    
}
