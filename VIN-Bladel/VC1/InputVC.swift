//
//  InputVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 12/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class InputVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var vinTextfield: UITextField!
    
    var carData : VehicleData?
    var customerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        searchButton.backgroundColor = UIColor(red:0.20, green:0.62, blue:0.91, alpha:1.0)
        searchButton.backgroundColor = UIColor.lightGray
        searchButton.isEnabled = false

    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if vinTextfield.text?.count == 17
        {
            searchButton.backgroundColor = UIColor(red:0.51, green:0.77, blue:1.00, alpha:1.0)
            searchButton.isEnabled = true
            carData = vehicleDB.searchByVIN(vin: vinTextfield.text!)
        }
        else
        {
            searchButton.isEnabled = false
            searchButton.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func searchVIN(_ sender: Any)
    {
        if (carData?.fromDatabase)! {
            self.performSegue(withIdentifier: "manualToCarInfo", sender: nil)
        }
        else {
            self.performSegue(withIdentifier: "inputNotFound", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? CarInfoViewController
        {
            destination.car = carData
        }
        
        if segue.destination is DataNotFoundViewController
        {
            if(self.carData?.error != nil) {
                let alert = UIAlertController(title: "Error", message: "Invalid VIN", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                let destination = segue.destination as? DataNotFoundViewController
                destination?.carData = carData!
                destination?.customerArray = customerArray
                destination?.vehicleDB = vehicleDB
            }
        }
    
    }
}
