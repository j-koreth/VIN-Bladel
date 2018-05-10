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
    @IBOutlet weak var newTextfieldButton: UIButton!
    
    var listOfParts = [String]()
    var partsArray = [Part]()
    var customerPartsArray = [UITextField()]
    var customerQuantityArray = [UILabel()]
    var partCount = 0
    
    var lastTextfieldY = 211
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for part in PartsDatabase.database
        {
            listOfParts.append(part.name)
        }
        addNewQuantity()
        addNewTextfield()
    }

    @IBAction func addNewPart(_ sender: Any)
    {
        if partCount < 4
        {
            addNewTextfield()
            addNewQuantity()
        }
        else if partCount == 4
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
        var partTextfield = SearchTextField(frame: CGRect(x: 150, y: lastTextfieldY + 75, width: 500, height: 60))
        partTextfield.delegate = self
        partTextfield.tag = partCount
        
        partTextfield.placeholder = "Add Service"
        partTextfield.filterStrings(listOfParts)
        
        partTextfield.startSuggestingInmediately = true
        partTextfield.borderStyle = UITextBorderStyle.line
        partTextfield.font = UIFont.systemFont(ofSize: 35)
        partTextfield.theme.font = UIFont.systemFont(ofSize: 30)
        partTextfield.theme.cellHeight = 60
        partTextfield.maxResultsListHeight = 600
        
        self.view.addSubview(partTextfield)
        
        var quantityTextfield = UITextView(frame: CGRect(x: 100, y: lastTextfieldY + 75, width: 475, height: 60))
        lastTextfieldY = Int(quantityTextfield.frame.midY)
        self.view.addSubview(quantityTextfield)
        
        customerPartsArray.append(partTextfield)
        newTextfieldButton.frame.origin.y = partTextfield.frame.midY
        lastTextfieldY = Int(partTextfield.frame.midY)
        partCount += 1

    }
    
    func addNewQuantity()
    {
        var partQuantity = UIStepper(frame: CGRect(x: 20, y: lastTextfieldY + 110, width: 90, height: 29))
        partQuantity.tag = partCount
        partQuantity.addTarget(self, action: #selector(PartsVC.incrementQuantity(sender:)), for: .valueChanged)
        self.view.addSubview(partQuantity)
        
        var quantityLabel = UILabel(frame: CGRect(x: 50, y: lastTextfieldY + 65, width: 45, height: 50))
        quantityLabel.text = "0"
        quantityLabel.font = UIFont(name: "AvenirNext-Regular", size: 30)
        quantityLabel.tag = partCount
        customerQuantityArray.append(quantityLabel)
        self.view.addSubview(quantityLabel)
        
    }
    
    @objc func incrementQuantity(sender: UIStepper!)
    {
        let stepperValue = Int(sender.value)
        customerQuantityArray[sender.tag].text = String(stepperValue)
        print(customerQuantityArray[sender.tag].text)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        customerPartsArray[textField.tag] = textField
    }


}
