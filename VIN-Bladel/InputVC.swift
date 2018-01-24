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
    
    var barcode = ""
    var carData : VINData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        searchButton.backgroundColor = UIColor.lightGray
        searchButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        barcode = vinTextfield.text!
        carData = VINData(vinNumber: barcode)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        if vinTextfield.text?.count == 17
        {
            searchButton.backgroundColor = UIColor(red:0.51, green:0.77, blue:1.00, alpha:1.0)
            searchButton.isEnabled = true
        }
        else{
            searchButton.isEnabled = false
            searchButton.backgroundColor = UIColor.lightGray
        }
    }
    
    
    @IBAction func manualToCarInfo(_ sender: Any)
    {
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            if(self.carData?.error != nil){
                let alert = UIAlertController(title: "ERROR", message: self.carData?.error, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                self.performSegue(withIdentifier: "manualToCarInfo", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CarInfoViewController
        {
            print("passing")
            destination.car = carData
        }
    }
}
