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
    
    
    var labelTitles = ["VIN:", "Make:", "Model:", "Submodel:", "Model Year:", "Engine (L):", "Cylinders:", "Transmission:", "Drive Type:"]
    var textViewInformation = [String?]()
    
    var customer: CustomerData?
    var car: VehicleData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textViewInformation = [car?.VIN, car?.vehicleMake, car?.vehicleModel, car?.vehicleSubModel, car?.vehicleModelYear, car?.vehicleDisplacement, car?.vehicleCylinder, car?.vehicleTransmission, car?.vehicleDriveType]
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        nameLabel.text = (customer?.customerFirst)! + " " + (customer?.customerLast)!
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        car?.updateAField(field: "VIN:", value: textViewInformation[0]!)
        
//        car?.updateAField(field: "Make:", value: !)
//        car?.updateAField(field: "Model:", value: [2]!)
//        car?.updateAField(field: "Submodel:", value: [3]!)
//        car?.updateAField(field: "Model Year:", value: [4]!)
//        car?.updateAField(field: "Engine (L):", value: )
//        car?.updateAField(field: "Cylinders:", value: <#T##String#>)
//        car?.updateAField(field: "Transmission:", value: <#T##String#>)
//        car?.updateAField(field: "Drive Type:", value: <#T##String#>)




        



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
