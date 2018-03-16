//
//  ServiceVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import SearchTextField

class ServiceVC: UIViewController {
    
    var serviceArray = ["Hi", "I", "want", "to", "die"]
    var service = [PartOrService]()

    var lastTextfieldY = 186
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var serviceTextfield = SearchTextField(frame: CGRect(x: 100, y: 286, width: 628, height: 60))
        serviceTextfield.placeholder = "Add Service"
        serviceTextfield.borderStyle = UITextBorderStyle.line
        serviceTextfield.font = UIFont.systemFont(ofSize: 35)
        serviceTextfield.theme.font = UIFont.systemFont(ofSize: 30)
        serviceTextfield.theme.cellHeight = 60

        self.view.addSubview(serviceTextfield)
        
        serviceTextfield.startSuggestingInmediately = true
        serviceTextfield.filterStrings(serviceArray)
        
        
    }

    @IBAction func addNewService(_ sender: Any)
    {
    }
    
    func addNewTextfield() -> UITextField
    {
        var serviceTextfield = SearchTextField(frame: CGRect(x: 100, y: lastTextfieldY+100, width: 628, height: 60))
        serviceTextfield.placeholder = "Add Service"
        serviceTextfield.borderStyle = UITextBorderStyle.line
        serviceTextfield.font = UIFont.systemFont(ofSize: 35)
        serviceTextfield.theme.font = UIFont.systemFont(ofSize: 30)
        serviceTextfield.theme.cellHeight = 60
        
        self.view.addSubview(serviceTextfield)
        
        serviceTextfield.startSuggestingInmediately = true
        serviceTextfield.filterStrings(serviceArray)
        
        return serviceTextfield
    }
    
}
