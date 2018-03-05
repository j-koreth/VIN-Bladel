//
//  ServiceVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class ServiceVC: UIViewController {

    var car = VehicleData()
    var customer: CustomerData!
    var tbc: TabBarVC?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbc = tabBarController as? TabBarVC
        tbc?.car = car
        tbc?.customer = customer

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        if customer == nil
        {
            customer = tbc?.customer
        }
        if customer == nil
        {
            car = (tbc?.car)!
        }
    }

}
