//
//  ServiceVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class ServiceVC: UIViewController {

    var tbc: TabBarVC?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbc = tabBarController as? TabBarVC
        
        // Do any additional setup after loading the view.
    }

}
