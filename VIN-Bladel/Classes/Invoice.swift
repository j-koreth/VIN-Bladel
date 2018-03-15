//
//  Invoice.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 3/15/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

//var x = Database.database().reference().root.child("invoices")

class Invoice
{
    var vehicleID: String!
    var invoiceID: String!
    var invoiceNumber: String!
    var invoiceDateStart: String!
    var invoiceTimeStart: String!
    var invoiceDateComplete: String!
    var invoiceTimeComplete: String!
    var mechanic: String!
    var invoiceTotal: String!
    var invoicePartsTotal: String!
    var invoiceLaborTotal: String!
    var invoiceOtherTotal: String!
    var invoiceProblem: String!
    var invoicePaid: String!
    var invoiceBalance: String!
    var invoiceMileage: String!
    var invoiceSubtotal: String!
    var invoiceShipName: String!
    var invoiceClosed: String!
    
    init(vehicleID: String, invoiceID: String, invoiceNumber: String, invoiceDateStart: String, invoiceTimeStart: String, invoiceDateComplete: String, invoiceTimeComplete: String, mechanic: String, invoiceTotal: String, invoicePartsTotal: String, invoiceLaborTotal: String, invoiceOtherTotal: String, invoiceProblem: String, invoicePaid: String, invoiceBalance: String, invoiceMileage: String, invoiceSubtotal: String, invoiceShipName: String, invoiceClosed: String) {
        self.vehicleID = vehicleID
        self.invoiceID = invoiceID
        self.invoiceNumber = invoiceNumber
        self.invoiceDateStart = invoiceDateStart
        self.invoiceTimeStart = invoiceTimeStart
        self.invoiceDateComplete = invoiceDateComplete
        self.invoiceTimeComplete = invoiceTimeComplete
        self.mechanic = mechanic
        self.invoiceTotal = invoiceTotal
        self.invoicePartsTotal = invoicePartsTotal
        self.invoiceLaborTotal = invoiceLaborTotal
        self.invoiceOtherTotal = invoiceOtherTotal
        self.invoiceProblem = invoiceProblem
        self.invoicePaid = invoicePaid
        self.invoiceBalance = invoiceBalance
        self.invoiceMileage = invoiceMileage
        self.invoiceSubtotal = invoiceSubtotal
        self.invoiceShipName = invoiceShipName
        self.invoiceClosed = invoiceClosed
    }
}
