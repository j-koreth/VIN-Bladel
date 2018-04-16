//
//  InvoiceComposer.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 3/14/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class InvoiceComposer: NSObject {

    let pathToInvoiceHTMLTemplate = Bundle.main.path(forResource: "invoice", ofType: "html")
    let pathToSingleItemHTMLTemplate = Bundle.main.path(forResource: "single_item", ofType: "html")
    let pathToLastItemHTMLTemplate = Bundle.main.path(forResource: "last_item", ofType: "html")
    let senderInfo = "Jim Van Bladel<br>1900 East Thomas<br>Arlington Heights, IL<br>"

    let dueDate = ""
    let paymentMethod = "Wire Transfer"
    let logoImageURL = "https://blog.gopenske.com/wp-content/uploads/penske-is-ase-certified-training-provider.jpg"
    var invoiceNumber: String!
    var pdfFilename: String!

    override init() {
        super .init()
    }
    func renderInvoice(invoiceNumber: String, invoiceDate: String, recipientInfo: String, items: [[String: String]], totalAmount: String) -> String! {
        // Store the invoice number
        self.invoiceNumber = invoiceNumber

        do {
            // Load the invoice HTML template code into a String variable
            var HTMLContent = try String(contentsOfFile: pathToInvoiceHTMLTemplate!)

            // Replace all the placeholders with real values except for the items
            HTMLContent = HTMLContent.replacingOccurrences(of: "#LOGO_IMAGE#", with: logoImageURL)

            HTMLContent = HTMLContent.replacingOccurrences(of: "#INVOICE_NUMBER#", with: invoiceNumber)

            HTMLContent = HTMLContent.replacingOccurrences(of: "#INVOICE_DATE#", with: invoiceDate)

            HTMLContent = HTMLContent.replacingOccurrences(of: "#DUE_DATE#", with: dueDate)

            HTMLContent = HTMLContent.replacingOccurrences(of: "#SENDER_INFO#", with: senderInfo)

            HTMLContent = HTMLContent.replacingOccurrences(of: "#RECIPIENT_INFO#", with: recipientInfo.replacingOccurrences(of: "\n", with: "<br>"))

            HTMLContent = HTMLContent.replacingOccurrences(of: "#PAYMENT_METHOD#", with: paymentMethod)

            HTMLContent = HTMLContent.replacingOccurrences(of: "#TOTAL_AMOUNT#", with: totalAmount)
            ///////////////////////

            var allItems = ""

            for i in 0..<items.count {
                var itemHTMLContent: String!

                if i != items.count - 1 {
                    itemHTMLContent = try String(contentsOfFile: pathToSingleItemHTMLTemplate!)
                }
                else {
                    itemHTMLContent = try String(contentsOfFile: pathToLastItemHTMLTemplate!)
                }

                itemHTMLContent = itemHTMLContent.replacingOccurrences(of: "#ITEM_DESC#", with: items[i]["item"]!)

                let formattedPrice = AppDelegate.getAppDelegate().getStringValueFormattedAsCurrency(items[i]["price"]!)
                
                itemHTMLContent = itemHTMLContent.replacingOccurrences("#PRICE#", with: formattedPrice)

                // Add the item's HTML code to the general items string.
                allItems += itemHTMLContent
            }

            // Set the items.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#ITEMS#", with: allItems)

            // The HTML code is ready.
            return HTMLContent
        }
        catch {
            print("Unable to open and use HTML template files.")
        }

        return nil

    }
}

