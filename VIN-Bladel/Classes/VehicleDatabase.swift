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

class VehicleDatabase
{
    var database = [VehicleData]()
    var cdatabase = [CustomerData]()
    private var databaseReference = Database.database().reference()
    private var vehicleReference = DatabaseReference()
    
    init() {
        vehicleReference = databaseReference.root.child("vehicles")
    }
    
    func searchByVIN(vin: String) -> VehicleData?
    {
        for vehicle in database
        {
            if vehicle.VIN.lowercased() == vin.lowercased()
            {
                vehicle.fromDatabase = true
                return vehicle
            }
        }
        return VINData(vinNumber: vin)
    }
    
//    func getVehicleByID(vehicleCustomerID: String) -> VehicleData?
//    {
//        for vehicle in database
//        {
//            if vehicle.vehicleCustomerID =
//            
//        }
//    }
    
    func pullFromFirebase()
    {
        vehicleReference.observe(.value) { (snapshot) in
            for vehicles in snapshot.children.allObjects as! [DataSnapshot]
            {
                let object = vehicles.value as? [String: AnyObject]
                let vehicleCustomerID = object?["Customer ID"] as! String
                let vehicleKey = object?["Vehicle ID"] as! String
                let vehicleMake = object?["Make Description"] as! String
                let vehicleModel = object?["Model Description"] as! String
                
                let vehicleModelYear = object?["Year"] as! String
                let vehicleDisplacement = object?["Engine Description"] as! String
                let vehicleCylinder = object?["Number of Cylinders"] as! String
                let vehicleSubModel = object?["VehicleSubModel"] as! String
                let vehicleVIN = object?["VIN"] as! String

//                TO DO -
//                    Add transmission key to all vehicles in database
//                let vehicleTransmission = object?["Customer State"] as! String
                
                let vehicle = VehicleData(customerID: vehicleCustomerID, key: vehicleKey, make: vehicleMake, model: vehicleModel, modelyear: vehicleModelYear, displacement: vehicleDisplacement, cylinder: vehicleCylinder, drivetype: "", submodel: vehicleSubModel, vin: vehicleVIN)
                
                self.database.append(vehicle)
                
                
                
            }
        }
    }
    

    
    func updateToDatabase() {
//        let newVehicle = ["Vehicle ID": vehicleID, "Make Description": vehicleMake, "Model Description": vehicleModel, "Year": vehicleModelYear, "Engine Description": vehicleDisplacement, "Number of Cylinders": vehicleTransmission, "VehicleDriveType": vehicleDriveType, "Vehicle ID": VIN]
//
//        vehicleDatabase.child(vehicleIndex).setValue(newVehicle)
        
        
    }
}

