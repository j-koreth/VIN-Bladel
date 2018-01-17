//
//  ViewController.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/1/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController {

    var databaseReference = Database.database().reference()
    var customerDatabase: DatabaseReference?
    var vehicleDatabase: DatabaseReference?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        customerDatabase = databaseReference.root.child("customer")
        vehicleDatabase = databaseReference.root.child("vehicle")
        
                databaseReference.observe(.value) { (snapshot) in
                    
                }
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //help

}

