//
//  JSONData.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/6/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation

class VINData: VehicleData{
    
    init(vinNumber: String) {
        super.init()
        if Reachability.isConnectedToNetwork(){
            VIN = vinNumber
            getData(vinNumber: vinNumber)
        }
        else {
            error = "No Internet Connection"
        }
    }
    
    func getData(vinNumber : String) {
        let urlString = "https://vpic.nhtsa.dot.gov/api/vehicles/decodevinvalues/\(vinNumber)?format=json"
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { (myData, response, error) in
            if let JSONObject = try? JSONSerialization.jsonObject(with: myData!, options: .allowFragments) as! NSDictionary{
                let results = JSONObject.object(forKey: "Results") as! NSArray

                if(self.checkForErrors(results: results)){
                    self.serializeJSON(results: results)
                }
            }
        }.resume()
    }
    
    func checkForErrors(results : NSArray) -> Bool{
        let jsonerror = results.value(forKey: "ErrorCode") as! NSArray
        let errorc = Array(jsonerror[0] as! String)
        if (errorc[0] != "0"){
            error = "Invalid VIN"
            return false
        }
        return true
    }
    
    func serializeJSON(results : NSArray)
    {
        let modelyear = results.value(forKey: "ModelYear") as! NSArray
        vehicleModelYear = modelyear[0] as! String
        
        let make = results.value(forKey: "Make") as! NSArray
        vehicleMake = make[0] as! String
        
        let model = results.value(forKey: "Model") as! NSArray
        vehicleModel = model[0] as! String
        
        let submodel = results.value(forKey: "Series") as! NSArray
        vehicleSubModel = submodel[0] as! String
        
        let displacement = results.value(forKey: "DisplacementL") as! NSArray
        vehicleDisplacement = displacement[0] as! String
        if (vehicleDisplacement != nil && vehicleDisplacement != ""){
            vehicleDisplacement = String(round(Double(vehicleDisplacement)!*10)/10)
        }
        
        let cylinder = results.value(forKey: "EngineCylinders") as! NSArray
        vehicleCylinder = cylinder[0] as! String
        
        let transmission = results.value(forKey: "TransmissionStyle") as! NSArray
        vehicleTransmission = transmission[0] as! String
        
        let drivetype = results.value(forKey: "DriveType") as! NSArray
        vehicleDriveType = drivetype[0] as! String
        
        vehicleMileage = ""
    }
}
