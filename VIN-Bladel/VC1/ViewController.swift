//
//  ViewController.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/1/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var customerList = CustomerDB()
    var vehicleDB = VehicleDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black

        var customer = CustomerData(ID: "31", title: "Mr.", first: "Joel", last: "Koreth", address1: "John", address2: "Hersey", city: "Arlington Heights", state: "IL", zip: "60056", country: "USA", email: "jals@gmail.com", home: "lol", work: "Hexanetech")
        
        customerList.addCustomer(newCustomer: customer)
    
        print(customerList.database)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
