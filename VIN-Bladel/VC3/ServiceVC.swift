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
    
    var listOfServices = [String]()
    var serviceArray = [PartOrService]()
    var textFieldArray = [SearchTextField]()

    var lastTextfieldY = 211
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for partsOrService in PartsAndServicesDatabase.database
        {
            listOfServices.append(partsOrService.description)
        }
        addNewTextfield()
        
        
    }

    @IBAction func addNewService(_ sender: Any)
    {
        if textFieldArray.count < 5
        {
            addNewTextfield()
        }

    }
    
    func addNewTextfield()
    {
        var serviceTextfield = SearchTextField(frame: CGRect(x: 100, y: lastTextfieldY + 75, width: 575, height: 60))
        lastTextfieldY = Int(serviceTextfield.frame.midY)
    
        serviceTextfield.placeholder = "Add Service"
        serviceTextfield.filterStrings(listOfServices)

        serviceTextfield.startSuggestingInmediately = true
        serviceTextfield.borderStyle = UITextBorderStyle.line
        serviceTextfield.font = UIFont.systemFont(ofSize: 35)
        serviceTextfield.theme.font = UIFont.systemFont(ofSize: 30)
        serviceTextfield.theme.cellHeight = 60
        serviceTextfield.maxResultsListHeight = 600
        
        self.view.addSubview(serviceTextfield)
        
        
        textFieldArray.append(serviceTextfield)
    }
    
}
