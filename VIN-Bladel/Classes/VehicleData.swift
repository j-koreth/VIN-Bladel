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
    var VIN: String!

    var vehicleKey: String! = " "
    var vehicleCustomerID: String!
    var vehicleID: String!
    var vehicleMake: String!
    var vehicleModel: String!
    var vehicleModelYear: String!
    var vehicleDisplacement: String!
    var vehicleCylinder: String!
    var vehicleTransmission: String! = " "
    var vehicleDriveType: String! = " "
    var vehicleSubModel: String!
    var vehicleHomePhone: String!
    var vehicleWorkPhone: String!
    var vehicleMileage: String!
    
    var fromDatabase = false
    var error: String!
    
    init(){}
    
    init(vin: String, key: String, customerID: String, ID: String, make: String, model: String, modelyear: String, displacement: String, cylinder: String, drivetype: String, submodel: String, transmission: String, mileage: String) {
        
        VIN = vin
        vehicleCustomerID = customerID
        vehicleKey = key
        vehicleID = ID
        vehicleMake = make
        vehicleModel = model
        vehicleModelYear = modelyear
        vehicleDisplacement = displacement
        vehicleCylinder = cylinder
        vehicleTransmission = transmission
        vehicleSubModel = submodel
        vehicleMileage = mileage
    }
    
    func updateAField(field: String, value: String)
    {
        let vehicle = vehicleDatabase.child(vehicleKey)
        let vehicleField = [field: value]
        vehicle.updateChildValues(vehicleField)
    }
    
    func updateToDatabase() {
        let newVehicle = createANewVehicle()
        
        vehicleDatabase.child(vehicleKey).setValue(newVehicle)
    }

    func createANewVehicle() -> [String: String?] {
        let newVehicle = ["VIN": VIN, "Customer ID": vehicleCustomerID, "Vehicle ID": vehicleID, "Make Description": vehicleMake, "Model Description": vehicleModel, "Year": vehicleModelYear, "Engine Description": vehicleDisplacement, "Number of Cylinders": vehicleCylinder, "VehicleDriveType": vehicleDriveType, "VehicleSubModel": vehicleSubModel, "Transmission": vehicleTransmission, "Mileage": vehicleMileage]
        
        return newVehicle
    }
}
