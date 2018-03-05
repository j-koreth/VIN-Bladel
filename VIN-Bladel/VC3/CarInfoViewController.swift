//
//  CarInfoViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 12/11/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class CarInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var carTextField: UITextField!
}

class CarInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var labelTitles = ["VIN:", "Make:", "Model:", "Submodel:", "Model Year:", "Engine (L):", "Cylinders:", "Transmission:", "Drive Type:", "Milege:"]
    var textViewInformation = [String?]()
    
    var customer: CustomerData?
    var car: VehicleData?
    var vehicleDB = VehicleDatabase()
    var tbc: TabBarVC?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbc = tabBarController as? TabBarVC
        tbc?.car = car

        tbc?.customer = customer
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        if car?.fromDatabase == false
        {
            vehicleDB.addNewVehicle(newVehicle: car!)
        }
    
        textViewInformation = [car?.VIN, car?.vehicleMake, car?.vehicleModel, car?.vehicleSubModel, car?.vehicleModelYear, car?.vehicleDisplacement, car?.vehicleCylinder, car?.vehicleTransmission, car?.vehicleDriveType, car?.vehicleMileage]
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        nameLabel.text = "Customer: " + (customer?.customerFirst)! + " " + (customer?.customerLast)!
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        car?.VIN = textViewInformation[0]
        car?.vehicleMake = textViewInformation[1]
        car?.vehicleModel = textViewInformation[2]
        car?.vehicleSubModel = textViewInformation[3]
        car?.vehicleModelYear = textViewInformation[4]
        car?.vehicleDisplacement = textViewInformation[5]
        car?.vehicleCylinder = textViewInformation[6]
        car?.vehicleTransmission = textViewInformation[7]
        car?.vehicleDriveType = textViewInformation[8]
        car?.vehicleMileage = textViewInformation[9]

        car?.updateToDatabase()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        if customer == nil
        {
            customer = tbc?.customer
        }
        if car == nil
        {
            car = tbc?.car
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarInfoTableViewCell
        cell.carLabel?.text = labelTitles[indexPath.row]
        cell.carTextField.text = textViewInformation[indexPath.row]
        return cell
    }
}
