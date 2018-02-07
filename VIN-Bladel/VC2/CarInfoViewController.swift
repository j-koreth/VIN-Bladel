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
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var labelTitles = ["VIN:", "Make:", "Model:", "Submodel:", "Model Year:", "Engine (L):", "Cylinders:", "Transmission:", "Drive Type:"]
    var textViewInformation = [String?]()
    
    var customer: CustomerData?
    var car: VehicleData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewInformation = [car?.vehicleVIN, car?.vehicleMake, car?.vehicleModel, car?.vehicleSubModel, car?.vehicleModelYear, car?.vehicleDisplacement, car?.vehicleCylinder, car?.vehicleTransmission, car?.vehicleDriveType]
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
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
