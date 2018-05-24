//
//  Service.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 5/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class Service
{
    var name: String!
    var price: Double!
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}
