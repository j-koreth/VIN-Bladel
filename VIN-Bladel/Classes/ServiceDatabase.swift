//
//  ServiceDatabase.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 5/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

var serviceReference = Database.database().reference().root.child("Services")

class ServiceDatabase{
    static var database = [Service]()
    
    static func pullFromFirebase() -> [String : AnyObject]
    {
        var dictionaryValues:[String : AnyObject] = [:]
        //var dictionary: [String : String] = [:]
        serviceReference.observe(.value) { (snapshot) in
            for service in snapshot.children.allObjects as! [DataSnapshot]
            {
                var secondDictionary:[String : AnyObject] = [:]
                let object = service.value as? [String: AnyObject]
                print(object)
                
                
//                for thing in object!
//                {
//                    secondDictionary[thing.key as! String] = thing.value as AnyObject
//                }
                
                for i in 0 ... ((object?.count)! - 1)
                {
                    //secondDictionary[(object?.index(forKey: "\(i)"))!] = object?.index(forKey: "\(i)")?.hashValue
                }
                
                
                dictionaryValues = secondDictionary
                //dictionary["\(object?.keys)"] = object?.values
                //dictionary[service.key] = service.value as? String
                //dictionaryValues = (object?.values) as! [String : AnyObject]
                //                let name = object?["Name"] as! String
//                self.database.append(Service(name: name, price: <#T##Double#>))
            }
            
        }
        
        
        return dictionaryValues
        
        //return self.pullFromFirebase().object
    }
    
//    static func pullFromFirebase()
//    {
//        partsReference.observe(.value) { (snapshot) in
//            for part in snapshot.children.allObjects as! [DataSnapshot]
//            {
//                let object = part.value as? [String: AnyObject]
//                let dictionaryOfValues = object?.values
//                //let name = object?["Name"] as! String
//                print("a")
//                print(object)
//
//                //self.database.append(Part(name: name))
//            }
//        }
//    }
}
