//
//  ViewController.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/1/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var customerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()
    
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var manualButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        scanButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        scanButton.layer.cornerRadius = 75
        manualButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        manualButton.layer.cornerRadius = 75

    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ScanVC
        {
            destination.vehicleDB = vehicleDB
            destination.customerArray = customerArray
        }
        
        if let destination = segue.destination as? InputVC
        {
            destination.vehicleDB = vehicleDB
            destination.customerArray = customerArray
        }
    }
}
