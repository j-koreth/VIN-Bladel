//
//  ServiceVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import SearchTextField

class ServiceVC: UIViewController, UIPickerViewDataSource, UITableViewDataSource, UIPickerViewDelegate, UITableViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    var output: String = ""
    
    var services = ["Brakes":15.25,"Alignment":34.55,"Tires":65]
    var parts = ["Brakes":["Front Pads":67.50,"Rear Pads":67.50,"Front Rotors":125.43],"Alignment":["Stuff":56.78],"Tires":["Front Right":50,"Front Left":45]]
    
    var currentService: String = "Alignment"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts[currentService]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let partNames = Array(parts[currentService]!.keys)
        let prices = Array(parts[currentService]!.values)
        let formattedPrice = String(format: "%.2f", prices[indexPath.row])
        cell.textLabel?.text = "\(partNames[indexPath.row]) - $\(formattedPrice)"
        cell.accessoryType = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if UITableViewCellAccessoryType.checkmark == cell?.accessoryType {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return services.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(services.keys)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentService = Array(services.keys)[row]
        tableView.reloadData()
    }
    
    @IBAction func whenConfirmButtonPressed(_ sender: UIButton) {
        let rowChosen = pickerView.selectedRow(inComponent: 0)
        let title = Array(services.keys)[rowChosen]
        let price = Array(services.values)[rowChosen]
        output += "\(title) - $\(price)\n"
        
        for cell in tableView.visibleCells {
            if cell.accessoryType == UITableViewCellAccessoryType.checkmark {
                if let text = cell.textLabel?.text {
                    output += "\t\(text)\n"
                }
            }
        }
        
        textView.text = output
    }
    
    @IBAction func whenClearButtonPressed(_ sender: UIButton) {
        textView.text = ""
    }
}
