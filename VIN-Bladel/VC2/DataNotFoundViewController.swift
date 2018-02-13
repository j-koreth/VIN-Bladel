//
//  DataNotFoundViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 1/25/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class DataNotFoundViewController: UIViewController {
    
    @IBOutlet weak var newCustomerButton: UIButton!
    @IBOutlet weak var previousCustomerButton: UIButton!
    
    var customerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()
    var carData = VehicleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newCustomerButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        newCustomerButton.layer.cornerRadius = 60
        
        previousCustomerButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        previousCustomerButton.layer.cornerRadius = 60
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.destination is SearchCustomerViewController
        {
            let destination = segue.destination as? SearchCustomerViewController
            destination?.vehicleDB = vehicleDB
            destination?.customerArray = customerArray
        }
        
        if segue.destination is NewCutomerViewController
        {
            let destination = segue.destination as? NewCutomerViewController
            destination?.vehicleDB = vehicleDB
            destination?.customerArray = customerArray
        }
        
    }
}
