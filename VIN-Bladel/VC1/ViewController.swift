//
//  ViewController.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/1/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cutomerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black

        
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ScanVC
        {
            destination.vehicleDB = vehicleDB
            destination.customerArray = cutomerArray
        }
    }
}
