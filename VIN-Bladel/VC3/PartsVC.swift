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
    var customerPartsArray = [UITextField()]
    var customerQuantityArray = [UILabel()]
    
    var lastTextfieldY = 211
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tooManyLabel.textColor = UIColor(red:0.73, green:0.12, blue:0.20, alpha:1.0)

        for part in PartsDatabase.database
        {
            listOfParts.append(part.name)
        }
        addNewQuantity()
        addNewTextfield()
    }

    @IBAction func addNewPart(_ sender: Any)
    {
        if customerPartsArray.count < 5 && customerPartsArray.last?.text != ""
        {
            addNewQuantity()
            addNewTextfield()

        }
        else if customerPartsArray.count == 5
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
        partTextfield.tag = customerPartsArray.count
        
        partTextfield.placeholder = "Add Service"
        partTextfield.filterStrings(listOfParts)
        
        partTextfield.startSuggestingInmediately = true
        partTextfield.borderStyle = UITextBorderStyle.line
        partTextfield.font = UIFont.systemFont(ofSize: 35)
        partTextfield.theme.font = UIFont.systemFont(ofSize: 30)
        partTextfield.theme.cellHeight = 60
        partTextfield.maxResultsListHeight = 600
        
        self.view.addSubview(partTextfield)

        customerPartsArray.append(partTextfield)
        lastTextfieldY = Int(partTextfield.frame.midY)

    }
    
    func addNewQuantity()
    {
        var quantityStepper = UIStepper(frame: CGRect(x: 20, y: lastTextfieldY + 110, width: 90, height: 29))
        quantityStepper.tag = customerQuantityArray.count
        quantityStepper.addTarget(self, action: #selector(PartsVC.incrementQuantity(sender:)), for: .valueChanged)
        self.view.addSubview(quantityStepper)
        
        var quantityLabel = UILabel(frame: CGRect(x: 55, y: lastTextfieldY + 65, width: 45, height: 50))
        quantityLabel.text = "0"
        quantityLabel.font = UIFont(name: "AvenirNext-Regular", size: 30)
        quantityLabel.tag = customerQuantityArray.count
        customerQuantityArray.append(quantityLabel)
        self.view.addSubview(quantityLabel)
        
//        print("Label Count: " + String(quantityLabel.tag))
//        print("Stepper Count: " + String(quantityStepper.tag))

        
    }
    
    @objc func incrementQuantity(sender: UIStepper!)
    {
        let stepperValue = Int(sender.value)
        customerQuantityArray[sender.tag].text = String(stepperValue)
        print("Part " + String(sender.tag) + ": " + customerQuantityArray[sender.tag].text!)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        customerPartsArray[textField.tag] = textField
        print("Textfield " + String(textField.tag) + ": " + customerPartsArray[textField.tag].text!)
    }


}
