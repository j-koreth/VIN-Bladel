//
//  JSONData.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/6/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation

func JSONData(VINNumber : String){
    let urlString = "https://vpic.nhtsa.dot.gov/api/vehicles/decodevinvalues/\(VINNumber)?format=json"
    let url = URL(string: urlString)!
    URLSession.shared.dataTask(with: url) { (myData, response, error) in
        if let JSONObject = try? JSONSerialization.jsonObject(with: myData!, options: .allowFragments) as! NSDictionary{
            //                print(JSONObject)
            let results = JSONObject.object(forKey: "Results") as! NSArray
            print(results)
            print(VINNumber)
            let modelyear = results.value(forKey: "ModelYear") as! NSArray
            print(modelyear[0])
            let make = results.value(forKey: "Make") as! NSArray
            print(make[0])
            let model = results.value(forKey: "Model") as! NSArray
            print(model[0])
            
        }
        }.resume()
}
