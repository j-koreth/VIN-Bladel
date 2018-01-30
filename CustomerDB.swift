//
//  CustomerDatabase.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 1/30/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

class CustomerDB
{
    var database = [CustomerData]()
    private var databaseReference = Database.database().reference()
    private var customerReference = DatabaseReference()
    
    init() {
        customerReference = databaseReference.root.child("customers")
    }
    
    
    func deleteCustomerByName(first: String, last: String)
    {
        
    }
    
    func getCustomerByName(first: String, last: String) -> CustomerData?
    {
        for customer in database
        {
            if customer.customerFirst == first && customer.customerLast == last
            {
                return customer
            }
        }
        return nil
    }
    
    func pullFromFirebase()
    {
        customerReference.observe(.value) { (snapshot) in
            var num = 0
            for customers in snapshot.children.allObjects as! [DataSnapshot]
            {
                let index = String(num)
                let object = customers.value as? [String: AnyObject]
                let ID = object?["Customer ID"] as! String
                let title = object?["Customer Title"] as! String
                let first = object?["Customer First Name"] as! String
                let last = object?["Customer Last Name"] as! String
                
                let add1 = object?["Customer Addr1"] as! String
                let add2 = object?["Customer Addr2"] as! String
                let city = object?["Customer City"] as! String
                let state = object?["Customer State"] as! String
                let country = object?["Customer Country"] as! String
                let zip = object?["Customer Zip Code"] as! String
                
                let email = object?["Customer Email"] as! String
                let home = object?["Customer Home Phone"] as! String
                let work = object?["Customer Work Phone"] as! String
                
                
                let customer = CustomerData(index: index, ID: ID, title: title, first: first, last: last, address1: add1, address2: add2, city: city, state: state, zip: zip, country: country, email: email, home: home, work: work)
                
                self.database.append(customer)
                
            }
        }
    }
    
}
