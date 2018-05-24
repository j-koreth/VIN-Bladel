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

var serviceReference = Database.database().reference().root.child("services")

class ServiceDatabase{
    static var database = [Service]()
    
    static func pullFromFirebase()
    {
        serviceReference.observe(.value) { (snapshot) in
            for service in snapshot.children.allObjects as! [DataSnapshot]
            {
                print(service)
//                let object = service.value as? [String: AnyObject]
//                let name = object?["Name"] as! String
//                self.database.append(Service(name: name, price: <#T##Double#>))
            }
        }
    }
}
