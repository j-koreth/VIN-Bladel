//
//  ServiceVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import SearchTextField

class ServiceVC: UIViewController {
    
    var serviceArray = [SearchTextFieldItem(title: "Hi")]

    @IBOutlet weak var serviceTextfield: SearchTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceTextfield.filterItems(serviceArray)
        
        
        // Do any additional setup after loading the view.
    }

}
