//
//  Parts+Services.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 3/14/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

var partsandservicesReference = Database.database().reference().root.child("parts+services")

class PartsandServices{
    
    static func pullFromFirebase()
    {
        partsandservicesReference.observe(.value) { (snapshot) in
            for vehicles in snapshot.children.allObjects as! [DataSnapshot]
            {
                let object = vehicles.value as? [String: AnyObject]
                let core = object?["Core Linked to Part ID"] as! String
                let cost = object?["Cost"] as! String
                let dialBrandID = object?["DIALBrandID"] as! String
                let description = object?["Description"] as! String
                
                let credit = object?["Is Credit"] as! String
                let part = object?["Is Part"] as! String
                let itemID = object?["Item ID"] as! String
                let itemNumber = object?["Item Number"] as! String
                let linkedService = object?["Linked Service Number"] as! String
                let noteID = object?["NoteID"] as! String
                let partTaxable = object?["Part Taxable"] as! String
                let partCore = object?["Part has Core"] as! String
                let quantity = object?["Quantity"] as! String
                let reportID = object?["Report ID"] as! String
                let reportType = object?["Report Type"] as! String
                let sequenceNumber = object?["Sequence Number"] as! String
                let serviceFlatRate = object?["Service Flat Rate"] as! String
                let serviceFlatRateID = object?["Service Flat Rate ID"] as! String
                let total = object?["Total"] as! String
                let sequenceNumber = object?["Sequence Number"] as! String


                
                self.database.append(vehicle)
            }
            self.lastID = Int((self.database.last?.vehicleID)!)!
            
        }
        
    }
}
