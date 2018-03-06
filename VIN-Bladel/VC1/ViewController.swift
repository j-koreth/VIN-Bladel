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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        scanButton.layer.cornerRadius = 60
        manualButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        manualButton.layer.cornerRadius = 60
        
        VehicleDatabase.pullFromFirebase()

    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
