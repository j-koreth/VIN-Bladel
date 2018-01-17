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
    
    var labelTitles = ["VIN:", "Make:", "Model:", "Model Year:", "Engine (L):", "Transmission:", "Drive Type:"]
    //var labelTitles = ["VIN:", "Make:", "Model:", "Submodel", "Model Year:", "Engine (L):", "Transmission:", "Drive Type:"]
    var textViewInformation = [String?]()
    
    var car: VINData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewInformation = [car?.vinNumber, car?.make, car?.model, car?.modelyear, car?.displacement, car?.transmission, car?.drivetype]
        
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
