//
//  PartsVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 4/30/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import SearchTextField

class PartsVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tooManyLabel: UILabel!
    
    var listOfParts = [String]()
    var partsArray = [Part]()
    var textFieldArray = [SearchTextField]()
    
    var lastTextfieldY = 211
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for part in PartsDatabase.database
        {
            listOfParts.append(part.name)
        }
        addNewTextfield()
    }

    @IBAction func addNewPart(_ sender: Any)
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
        var partTextfield = SearchTextField(frame: CGRect(x: 100, y: lastTextfieldY + 75, width: 550, height: 60))
        lastTextfieldY = Int(partTextfield.frame.midY)
        
        partTextfield.placeholder = "Add Service"
        partTextfield.filterStrings(listOfParts)
        
        partTextfield.startSuggestingInmediately = true
        partTextfield.borderStyle = UITextBorderStyle.line
        partTextfield.font = UIFont.systemFont(ofSize: 35)
        partTextfield.theme.font = UIFont.systemFont(ofSize: 30)
        partTextfield.theme.cellHeight = 60
        partTextfield.maxResultsListHeight = 600
        
        self.view.addSubview(partTextfield)
        
        
        textFieldArray.append(partTextfield)
    }


}
