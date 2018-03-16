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


var invoiceReference = Database.database().reference().root.child("invoices")

class InvoiceDatabase{
    static var database = [Invoice]()
    
    static func pullFromFirebase()
    {
        invoiceReference.observe(.value) { (snapshot) in
            for invoice in snapshot.children.allObjects as! [DataSnapshot]
            {
                let object = invoice.value as? [String: AnyObject]
                let vehicleID = object?["Vehicle ID"] as! String
                let invoiceID = object?["Invoice ID"] as! String
                let invoiceNumber = object?["Invoice Number"] as! String
                let invoiceDateStart = object?["Invoice Date Received"] as! String
                let invoiceTimeStart = object?["Invoice Time Received"] as! String
                let invoiceDateComplete = object?["Invoice Date Completed"] as! String
                let invoiceTimeComplete = object?["Invoice Time Completed"] as! String
                let mechanic = object?["Invoice Mechanic"] as! String
                let invoiceTotal = object?["Invoice Total"] as! String
                let invoicePartsTotal = object?["Invoice Parts Total"] as! String
                let invoiceLaborTotal = object?["Invoice Labor Total"] as! String
                let invoiceOtherTotal = object?["Invoice Other Total"] as! String
                let invoiceProblem = object?["Invoice Problem Description"] as! String
                let invoicePaid = object?["Invoice Amount Paid"] as! String
                let invoiceBalance = object?["Invoice Balance Due"] as! String
                let invoiceMileage = object?["Invoice Mileage"] as! String
                let invoiceSubtotal = object?["Invoice Subtotal"] as! String
                let invoiceShipName = object?["Invoice Ship To Name"] as! String
                let invoiceClosed = object?["Invoice Closed"] as! String
                self.database.append(Invoice(vehicleID: vehicleID, invoiceID: invoiceID, invoiceNumber: invoiceNumber, invoiceDateStart: invoiceDateStart, invoiceTimeStart: invoiceTimeStart, invoiceDateComplete: invoiceDateComplete, invoiceTimeComplete: invoiceTimeComplete, mechanic: mechanic, invoiceTotal: invoiceTotal, invoicePartsTotal: invoicePartsTotal, invoiceLaborTotal: invoiceLaborTotal, invoiceOtherTotal: invoiceOtherTotal, invoiceProblem: invoiceProblem, invoicePaid: invoicePaid, invoiceBalance: invoiceBalance, invoiceMileage: invoiceMileage, invoiceSubtotal: invoiceSubtotal, invoiceShipName: invoiceShipName, invoiceClosed: invoiceClosed))
            }
            
        }
        
    }
}
