//
//  customerCarsVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class CustomerCarsVC: UIViewController {
    
    @IBOutlet weak var customerCarTable: UITableView!
    
    var numberOfCars = 0
    var carThatGotPassed: CustomerData?
    var arrayOfCarNames = [String]()
    var arrayOfCarIDs = [Int]()
    var arrayOfCars = [VehicleData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfCars = VehicleDatabase.searchForCarsWithACertainCustomerID(customerID: (carThatGotPassed?.customerID)!) as! [VehicleData]
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfCars.count
 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var theCarBeingShown = arrayOfCars[indexPath.row]
        
        cell.textLabel?.text = theCarBeingShown.vehicleMake
        
        
        return cell
    }

}
