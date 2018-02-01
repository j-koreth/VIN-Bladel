//
//  VehicleDB.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 1/31/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

class VehicleDB
{
    var database = [VehicleData]()
    private var databaseReference = Database.database().reference()
    private var vehicleReference = DatabaseReference()
    
    init() {
        vehicleReference = databaseReference.root.child("vehicles")
    }
    
    func searchByVIN(vin: String) -> VehicleData?
    {
        for vehicle in database
        {
            if vehicle.vehicleVIN == vin
            {
                return vehicle
            }
        }
        return nil
    }
    
    func pullFromFirebase()
    {
        vehicleReference.observe(.value) { (snapshot) in
            for vehicles in snapshot.children.allObjects as! [DataSnapshot]
            {
                let object = vehicles.value as? [String: AnyObject]
                let vehicleCustomerID = object?["Customer ID"] as! String
                let vehicleID = object?["Customer Title"] as! String
                let vehicleMake = object?["Customer First Name"] as! String
                let vehicleModel = object?["Customer Last Name"] as! String
                
                let vehicleModelYear = object?["Customer Addr1"] as! String
                let vehicleDisplacement = object?["Customer Addr2"] as! String
                let vehicleCylinder = object?["Customer City"] as! String
                let vehicleTransmission = object?["Customer State"] as! String
                let vehicleSubModel = object?["Customer Country"] as! String
                let vehicleVIN = object?["Customer Zip Code"] as! String

                
                let vehicle = VehicleData(customerID: vehicleCustomerID, ID: vehicleID, make: vehicleMake, model: vehicleModel, modelyear: vehicleModelYear, displacement: vehicleDisplacement, cylinder: vehicleCylinder, transmission: vehicleTransmission, drivetype: "", submodel: vehicleSubModel, vin: vehicleVIN)
                
                self.database.append(vehicle)
                
            }
        }
    }
    
}

