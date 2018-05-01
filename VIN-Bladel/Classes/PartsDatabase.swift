//
//  Parts+Services.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 3/14/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

var partsReference = Database.database().reference().root.child("parts")

class PartsDatabase{
    static var database = [Part]()

    static func pullFromFirebase()
    {
        partsReference.observe(.value) { (snapshot) in
            for part in snapshot.children.allObjects as! [DataSnapshot]
            {
                let object = part.value as? [String: AnyObject]
                let name = object?["Name"] as! String
                self.database.append(Part(name: name))
            }
        }
    }
}
