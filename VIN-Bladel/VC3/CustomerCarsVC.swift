//
//  customerCarsVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class CustomerCarsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var customerCarTable: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var arrayOfCars = [VehicleData]()
    
    override func viewDidLoad() {
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = "\(arrayOfCars[(indexPath as NSIndexPath).row].vehicleModelYear!)" + " " + "\(arrayOfCars[(indexPath as NSIndexPath).row].vehicleModel!)"

        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! TabBarVC
        let indexPath = customerCarTable.indexPathForSelectedRow!
        car = arrayOfCars[(indexPath as NSIndexPath).row]
    }

}
