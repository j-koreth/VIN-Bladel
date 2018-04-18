//
//  CustomPrintPageRenderer.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 4/18/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class CustomPrintPageRenderer: UIPrintPageRenderer {
    
    let letterPageWidth: CGFloat = 612
    let letterPageHeight: CGFloat = 792

    override init() {
        super.init()
        
        // Specify the frame of the page.
        let pageFrame = CGRect(x: 0.0, y: 0.0, width: letterPageWidth, height: letterPageHeight)
        
        // Set the page frame.
        self.setValue(NSValue(CGRect: pageFrame), forKey: "paperRect")
        
        // Set the horizontal and vertical insets (that's optional).
        self.setValue(NSValue(CGRect: pageFrame), forKey: "printableRect")
    }

}
