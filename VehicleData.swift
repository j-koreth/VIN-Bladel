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
    var vehicleIndex: String!
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
    var vehicleVIN: String!
    var vehicleHomePhone: String!
    var vehicleWorkPhone: String!
    
    init(index: String, customerID: String, ID: String, make: String, model: String, modelyear: String, displacement: String, cylinder: String, transmission: String, drivetype: String, submodel: String, vin: String) {
        vehicleIndex = index
        vehicleCustomerID = customerID
        vehicleID = ID
        vehicleMake = make
        vehicleModel = model
        vehicleModelYear = modelyear
        vehicleDisplacement = displacement
        vehicleCylinder = cylinder
        vehicleTransmission = transmission
        vehicleSubModel = drivetype
        vehicleVIN = vin

    }
    
    func updateToDatabase() {
        let newVehicle = ["Customer ID": vehicleID, "Vehicle ID": vehicleID, "Make Description": vehicleMake, "Model Description": vehicleModel, "Year": vehicleModelYear, "Engine Description": vehicleDisplacement, "Number of Cylinders": vehicleTransmission, "VehicleDriveType": vehicleDriveType, "Vehicle ID": vehicleVIN]

        vehicleDatabase.child(vehicleIndex).setValue(newVehicle)


    }
}
