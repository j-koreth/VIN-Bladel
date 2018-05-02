//
//  ServiceVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import SearchTextField

class ServiceVC: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var tooManyLabel: UILabel!
    
    var listOfServices = [String]()
    var serviceArray = [Service]()
    var textFieldArray = [SearchTextField]()

    var lastTextfieldY = 211
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tooManyLabel.textColor = UIColor(red:0.73, green:0.12, blue:0.20, alpha:1.0)
        
        for service in ServiceDatabase.database
        {
            listOfServices.append(service.name)
        }
        addNewTextfield()
        
        
    }

    @IBAction func addNewService(_ sender: Any)
    {
        if textFieldArray.count < 4 && textFieldArray.last?.text != ""
        {
            addNewTextfield()
        }
        else if textFieldArray.count == 4
        {
            tooManyLabel.text = "Max of 4 Services"
        }
        else
        {
            tooManyLabel.text = "Please add a Service"
        }

    }
    
    func addNewTextfield()
    {
        var serviceTextfield = SearchTextField(frame: CGRect(x: 100, y: lastTextfieldY + 75, width: 550, height: 60))
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
