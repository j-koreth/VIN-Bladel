//
//  PreviewViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 3/15/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    @IBOutlet weak var webPreview: UIWebView!

    var invoiceInfo: [String: AnyObject]!

    var invoiceComposer: InvoiceComposer!

    var HTMLContent: String!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createInvoiceAsHTML()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func createInvoiceAsHTML() {
        invoiceComposer = InvoiceComposer()
        if let invoiceHTML = invoiceComposer.renderInvoice(invoiceNumber: invoiceInfo["invoiceNumber"] as! String,
                             invoiceDate: invoiceInfo["invoiceDate"] as! String,
                             recipientInfo: invoiceInfo["recipientInfo"] as! String,
                             items: invoiceInfo["items"] as! [[String: String]],
                             totalAmount: invoiceInfo["totalAmount"] as! String) {
            webPreview.loadHTMLString(invoiceHTML, baseURL: NSURL(string: invoiceComposer.pathToInvoiceHTMLTemplate!)!)
            HTMLContent = invoiceHTML
        }
    }

    @IBAction func exportToPDF(_ sender: AnyObject) {

    }

}


