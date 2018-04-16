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

var vehicleReference = Database.database().reference().root.child("vehicles")


class VehicleDatabase
{
    static var database = [VehicleData]()
    
    static var lastID = 0
    
    
    static func searchByVIN(vin: String) -> VehicleData?
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
    
    static func pushToFirebase()
    {
        for vehicles in database
        {
            vehicles.updateToDatabase()
        }
    }
    
    static func addNewVehicle(newVehicle: VehicleData)
    {
        let key = vehicleReference.childByAutoId().key
        let num = database.count
        
        newVehicle.vehicleKey = String(num)
        newVehicle.vehicleID = String(lastID + 1)
        
        database.append(newVehicle)
        let vehicleDictionary = newVehicle.createANewVehicle()
        vehicleReference.child(key).setValue(vehicleDictionary)
    }
    
    static func pullFromFirebase()
    {
        vehicleReference.observe(.value) { (snapshot) in
            for vehicles in snapshot.children.allObjects as! [DataSnapshot]
            {
                let object = vehicles.value as? [String: AnyObject]
                let vehicleKey = vehicles.key
                let vehicleCustomerID = object?["Customer ID"] as! String
                let vehicleID = object?["Vehicle ID"] as! String
                let vehicleMake = object?["Make Description"] as! String
                let vehicleModel = object?["Model Description"] as! String
                
                let vehicleModelYear = object?["Year"] as! String
                let vehicleDisplacement = object?["Engine Description"] as! String
                let vehicleCylinder = object?["Number of Cylinders"] as! String
                let vehicleSubModel = object?["VehicleSubModel"] as! String
                let vehicleVIN = object?["VIN"] as! String
//                let vehicleDriveType = object?["VIN"] as! String
                let vehicleTransmission = object?["Transmission"] as! String
                let vehicleMileage = object?["Mileage"] as! String

                
                let vehicle = VehicleData(vin: vehicleVIN, key: vehicleKey, customerID: vehicleCustomerID, ID: vehicleID, make: vehicleMake, model: vehicleModel, modelyear: vehicleModelYear, displacement: vehicleDisplacement, cylinder: vehicleCylinder, drivetype: "", submodel: vehicleSubModel, transmission: vehicleTransmission, mileage: vehicleMileage)
                self.database.append(vehicle)
            }
            self.lastID = Int((self.database.last?.vehicleID)!)!

        }

    }
    
    static func searchForCarsWithACertainCustomerID(customerID: String) -> [Any]
    {
        var arrayOfCars = [Any]()

        for car in database
        {
            if car.vehicleCustomerID == customerID
            {
                car.fromDatabase = true
                arrayOfCars.append(car)
                
            }
        }
 
        return arrayOfCars
    }
    
}
