//
//  PartOrService.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 3/14/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
var partsAndServicesReference = Database.database().reference().root.child("parts+services")

class PartOrService
{
    var core: String!
    var cost: String!
    var dialBrandID: String!
    var description: String!
    var credit: String!
    var part: String!
    var itemID: String!
    var itemNumber: String!
    var linkedService: String!
    var noteID: String!
    var partTaxable: String!
    var partCore: String!
    var quantity: String!
    var reportID: String!
    var reportType: String!
    var sequenceNumber: String!
    var serviceFlatRate: String!
    var serviceFlatRateID: String!
    var total: String!
    var vehicleID: String!
    
    init(core: String, cost: String, dialBrandID: String, description: String, credit: String, part: String, itemID: String, itemNumber: String, linkedService: String, noteID: String, partTaxable: String, partCore: String, quantity: String, reportID: String, reportType: String, sequenceNumber: String, serviceFlatRate: String, serviceFlatRateID: String, total: String, vehicleID: String) {
        self.core = core
        self.cost = cost
        self.dialBrandID = dialBrandID
        self.description = description
        self.credit = credit
        self.part = part
        self.itemID = itemID
        self.itemNumber = itemNumber
        self.linkedService = linkedService
        self.noteID = noteID
        self.partTaxable = partTaxable
        self.partCore = partCore
        self.quantity = quantity
        self.reportID = reportID
        self.reportType = reportType
        self.sequenceNumber = sequenceNumber
        self.serviceFlatRate = serviceFlatRate
        self.serviceFlatRateID = serviceFlatRateID
        self.total = total
        self.vehicleID = vehicleID


        
    }
}
