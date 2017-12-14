//
//  CarInfoViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 12/11/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class CarInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var carArray = [String]()

    
    var car: VINData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        return cell
    }
    

    
}
