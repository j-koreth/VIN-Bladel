//
//  CarInfoViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 12/11/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class CarInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var labelTitles = ["Vin Number:", "Model Year:", "Make:", "Model:", "Displacement:"]
    var textViewInformation = [String?]()

    
    var car: VINData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(car?.model)
        textViewInformation = [car?.vinNumber, car?.modelyear, car?.make, car?.model, car?.displacement]
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = labelTitles[indexPath.row]
        cell.detailTextLabel?.text = textViewInformation[indexPath.row]
        return cell
    }
    

    
}
