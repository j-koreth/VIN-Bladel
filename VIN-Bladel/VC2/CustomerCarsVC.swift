//
//  customerCarsVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell
{
    @IBOutlet weak var carLabel: UITextField!
    
}

class CustomerCarsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var customerCarTable: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var arrayOfCars = [VehicleData]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        customerCarTable.delegate = self
        customerCarTable.dataSource = self
        
        nameLabel.text = (customer?.customerFirst)! + " " + (customer?.customerLast)!
        
        arrayOfCars = VehicleDatabase.searchForCarsWithACertainCustomerID(customerID: (customer?.customerID)!) as! [VehicleData]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayOfCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomerTableViewCell
        
        cell.carLabel?.text = "\(arrayOfCars[indexPath.row].vehicleModelYear!)" + " " + "\(arrayOfCars[indexPath.row].vehicleModel!)"

        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! TabBarVC
        let indexPath = customerCarTable.indexPathForSelectedRow!
        car = arrayOfCars[(indexPath as NSIndexPath).row]
    }

}
