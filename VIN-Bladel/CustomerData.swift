//
//  customerData.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 1/23/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation

class CustomerData
{
    var customerID: String!
    var customerTitle: String!
    var customerFirst: String!
    var customerLast: String!

    var customerAddress1: String!
    var customerAddress2: String!
    var customerCity: String!
    var customerState: String!
    var customerZip: String!
    var customerCountry: String!
    var customerEmail: String!
    var customerHomePhone: String!
    var customerWorkPhone: String!
    
    init(ID: String, title: String, first: String, last: String, address1: String, address2: String, city: String, state: String, zip: String, country: String, email: String, home: String, work: String) {
        customerID = ID
        customerTitle = title
        customerFirst = first
        customerLast = last
        customerAddress1 = address1
        customerAddress2 = address2
        customerCity = city
        customerState = state
        customerZip = zip
        customerCountry = country
        customerEmail = email
        customerHomePhone = home
        customerWorkPhone = work
    }

}
