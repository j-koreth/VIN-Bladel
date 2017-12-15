//
//  JSONData.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/6/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation

class VINData{
    var vinNumber: String!
    var modelyear: String!
    var make: String!
    var model: String!
    var displacement: String!
//    var cylinder: String!
    var correct: Bool!
    
    init(vinNumber: String) {
        self.vinNumber = vinNumber
        getJSONData(vinNumber: vinNumber)
    }
    
    func getJSONData(vinNumber : String) {
        let urlString = "https://vpic.nhtsa.dot.gov/api/vehicles/decodevinvalues/\(vinNumber)?format=json"
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { (myData, response, error) in
            if let JSONObject = try? JSONSerialization.jsonObject(with: myData!, options: .allowFragments) as! NSDictionary{
                let results = JSONObject.object(forKey: "Results") as! NSArray
                
                let modelyear = results.value(forKey: "ModelYear") as! NSArray
                self.modelyear = modelyear[0] as! String
                
                let make = results.value(forKey: "Make") as! NSArray
                self.make = make[0] as! String
                
                let model = results.value(forKey: "Model") as! NSArray
                self.model = model[0] as! String
                
                let displacement = results.value(forKey: "DisplacementL") as! NSArray
                self.displacement = displacement[0] as! String
                
                let cylinder = results.value(forKey: "EngineCylinders") as! NSArray
                self.cylinder = cylinder[0] as! String
                
                let errorcode = results.value(forKey: "ErrorCode") as! NSArray
                var errorcharacters = Array(errorcode[0] as! String)
                
                if (errorcharacters[0] == "0"){
                    self.correct = true
                }
                else {
                    self.correct = false
                }
            }
        }.resume()
    }
}

