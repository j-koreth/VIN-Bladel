//
//  DataNotFoundViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 1/25/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class DataNotFoundViewController: UIViewController {
    
    var customerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
