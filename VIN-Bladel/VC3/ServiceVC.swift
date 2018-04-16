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
    
    @IBOutlet weak var tooManyLabel: UILabel!
    
    var listOfServices = [String]()
    var serviceArray = [PartOrService]()
    var textFieldArray = [SearchTextField]()

    var lastTextfieldY = 211
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tooManyLabel.textColor = UIColor(red:0.73, green:0.12, blue:0.20, alpha:1.0)
        
        for partsOrService in PartsAndServicesDatabase.database
        {
            listOfServices.append(partsOrService.description)
        }
        addNewTextfield()
        
        
    }

    @IBAction func addNewService(_ sender: Any)
    {
        if textFieldArray.count < 5 && textFieldArray.last?.text != ""
        {
            addNewTextfield()
        }
        else if textFieldArray.count == 5
        {
            tooManyLabel.text = "Max of 5 Services"
        }
        else
        {
            tooManyLabel.text = "Please add a Service"
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
