//
//  InvoiceComposer.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 3/14/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class InvoiceComposer: NSObject {

    let pathToInvoiceHTMLTemplate = NSBundle.mainBundle().pathForResource("invoice", ofType: "html")
    let pathToSingleItemHTMLTemplate = NSBundle.mainBundle().pathForResource("single_item", ofType: "html")
    let pathToLastItemHTMLTemplate = NSBundle.mainBundle().pathForResource("last_item", ofType: "html")
    let senderInfo = "Gabriel Theodoropoulos<br>123 Somewhere Str.<br>10000 - MyCity<br>MyCountry"
    let dueDate = ""
    let paymentMethod = "Wire Transfer"
    let logoImageURL = "http://www.appcoda.com/wp-content/uploads/2015/12/blog-logo-dark-400.png"
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
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#LOGO_IMAGE#", withString: logoImageURL)
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#INVOICE_NUMBER#", withString: invoiceNumber)
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#INVOICE_DATE#", withString: invoiceDate)
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#DUE_DATE#", withString: dueDate)
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#SENDER_INFO#", withString: senderInfo)
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#RECIPIENT_INFO#", withString: recipientInfo.stringByReplacingOccurrencesOfString("\n", withString: "<br>"))
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#PAYMENT_METHOD#", withString: paymentMethod)
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#TOTAL_AMOUNT#", withString: totalAmount)
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
                
                itemHTMLContent = itemHTMLContent.stringByReplacingOccurrencesOfString("#ITEM_DESC#", withString: items[i]["item"]!)
                
                //let formattedPrice = AppDelegate.getAppDelegate().getStringValueFormattedAsCurrency(items[i]["price"]!)
                //itemHTMLContent = itemHTMLContent.stringByReplacingOccurrencesOfString("#PRICE#", withString: formattedPrice)
                
                // Add the item's HTML code to the general items string.
                allItems += itemHTMLContent
            }
            
            // Set the items.
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#ITEMS#", withString: allItems)
            
            // The HTML code is ready.
            return HTMLContent
        }
        catch {
            print("Unable to open and use HTML template files.")
        }
        
        return nil
    
    }
}
