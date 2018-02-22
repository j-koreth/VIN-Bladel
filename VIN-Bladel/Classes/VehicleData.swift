//
//  VehicleData.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 1/25/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
var vehicleDatabase = Database.database().reference().root.child("vehicles")

class VehicleData
{
    var vehicleKey: String!
    var vehicleCustomerID: String!
    var vehicleID: String!
    var vehicleMake: String!
    var vehicleModel: String!
    var vehicleModelYear: String!
    var vehicleDisplacement: String!
    var vehicleCylinder: String!
    var vehicleTransmission: String!
    var vehicleDriveType: String!
    var vehicleSubModel: String!
    var VIN: String!
    var vehicleHomePhone: String!
    var vehicleWorkPhone: String!
    
    var fromDatabase = false
    var error: String!
    
    init(){}
    
    init(customerID: String, ID: String, make: String, model: String, modelyear: String, displacement: String, cylinder: String, drivetype: String, submodel: String, vin: String) {
        vehicleCustomerID = customerID
        vehicleID = ID
        vehicleMake = make
        vehicleModel = model
        vehicleModelYear = modelyear
        vehicleDisplacement = displacement
        vehicleCylinder = cylinder
        vehicleTransmission = ""
        vehicleSubModel = drivetype
        VIN = vin
    }
    
//    func updateAField(field: String, value: String)
//    {
//        let vehicle = vehicleDatabase.child(vehicleKey)
//        let vehicleField = [field: value]
//        vehicle.updateChildValues(vehicleField)
//
//    }
    
    func updateToDatabase() {
        let newVehicle = createANewVehicle()
        
        vehicleDatabase.child(vehicleKey).setValue(newVehicle)
        
    }

    func createANewVehicle() -> [String: String?] {
        let newVehicle = ["Vehicle Key": vehicleKey, "Vehicle ID": vehicleID, "Make Description": vehicleMake, "Model Description": vehicleModel, "Year": vehicleModelYear, "Engine Description": vehicleDisplacement, "Number of Cylinders": vehicleTransmission, "VehicleDriveType": vehicleDriveType, "Vehicle ID": VIN]
        
        return newVehicle
        
    }
}
