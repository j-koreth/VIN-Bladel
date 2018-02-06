//
//  SearchCustomerViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 1/25/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class SearchCustomerViewController: UIViewController {
    
    var customer: CustomerData!
    var customerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()

    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    
    @IBAction func searchButton(_ sender: UIButton)
    {
//        if customerArray.getCustomerByName(first: inputFirstName.text!, last: inputLastName.text!) != nil
//        {
        print(customerArray.database.count)
            print(inputFirstName.text!)
            print(inputLastName.text!)
            customer = customerArray.getCustomerByName(first: inputFirstName.text!, last: inputLastName.text!)
            pulledName.text = customer.customerFirst + " " + customer.customerLast
//        }
//        else
//        {
//            pulledName.text = "Try Again"
//        }
    }
    
    @IBOutlet weak var pulledName: UITextField!
    
    @IBAction func confirmButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
