//
//  NewCutomerViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 1/25/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class NewCutomerViewController: UIViewController {
    
    @IBOutlet weak var newFirstName: UITextField!
    @IBOutlet weak var newLastName: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    
    var customerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()
    
    @IBAction func confirmNewInfo(_ sender: UIButton) {
        if newFirstName.text == ""
        { newFirstName.placeholder = "Please enter a First Name" }
        
        if newLastName.text == ""
        { newLastName.placeholder = "Please enter a Last Name" }
        
        if newEmail.text == ""
        { newEmail.placeholder = "Please enter an Email" }
        
        if newFirstName.text != "" && newLastName.text != "" && newEmail.text != ""
        {
            var newCustomer = CustomerData(ID: "", title: "", first: newFirstName.text!, last: newLastName.text!, address1: "1900 E Thomas", address2: "", city: "Arlington Heights", state: "IL", zip: "60004", country: "", email: newEmail.text!, home: "", work: "")
            customerArray.addCustomer(newCustomer: newCustomer)


        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}
