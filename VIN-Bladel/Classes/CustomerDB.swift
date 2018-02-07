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

var customerReference = Database.database().reference().root.child("customers")


class CustomerDB
{
    var database = [CustomerData]()
    
    func addCustomer(newCustomer: CustomerData)
    {
        let key = customerReference.childByAutoId().key
        let num = database.count
        newCustomer.customerIndex = String(num)
        
        database.append(newCustomer)
        let customerDictionary = newCustomer.createNewCustomer()
        customerReference.child(key).setValue(customerDictionary)
    }
    
    func getCustomerByName(first: String, last: String) -> CustomerData?
    {
        for customer in database
        {
            if customer.customerFirst.lowercased() == first.lowercased()
                && customer.customerLast.lowercased() == last.lowercased()
            { return customer }
        }
        return nil
    }
    
    func getCustomerByIndex(index: String) -> CustomerData?
    {
        for customer in database
        {
            if customer.customerIndex == index { return customer }
        }
        return nil
    }
    
    func pullFromFirebase()
    {
        var num = 0

        customerReference.observe(.value) { (snapshot) in
            for customers in snapshot.children.allObjects as! [DataSnapshot]
            {
                let object = customers.value as? [String: AnyObject]
//                let index = object?["Customer Index"] as! String
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
                
                
                let customer = CustomerData(index: String(num), ID: ID, title: title, first: first, last: last, address1: add1, address2: add2, city: city, state: state, zip: zip, country: country, email: email, home: home, work: work)
                
                self.database.append(customer)
                
                num += 1
            }
        }
    }
    
    
    //Work in Progress
//    func deleteCustomerByName(first: String, last: String)
//    {
//        var theCustomer: CustomerData!
//        for customers in database
//        {
//            theCustomer = getCustomerByName(first: first, last: last)
//        }
//        var index = Int(theCustomer.customerIndex)
//        database.remove(at: index!)
//
//        var num = 0
//        for customers in database
//        {
//            customers.customerIndex = String(num)
//            num += 1
//
//        }
//
//    }
    
}
