//
//  ViewController.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/1/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import FirebaseDatabase

var car : VehicleData?
var customer : CustomerData?

class ViewController: UIViewController {
    
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var manualButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.hidesBackButton = true
        
        scanButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        scanButton.layer.cornerRadius = 40
        manualButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        manualButton.layer.cornerRadius = 40
        searchButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        searchButton.layer.cornerRadius = 40
    }
}
