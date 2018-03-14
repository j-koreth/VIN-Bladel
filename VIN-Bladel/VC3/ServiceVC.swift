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
    
    var serviceArray = ["Hi", "I", "want", "to", "die"]

    @IBOutlet weak var serviceTextfield: SearchTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceTextfield = SearchTextField()
        serviceTextfield.inlineMode = true
        serviceTextfield.filterStrings(serviceArray)
        
        view.addSubview(serviceTextfield)
        
        
        // Do any additional setup after loading the view.
    }

}
