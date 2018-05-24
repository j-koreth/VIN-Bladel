//
//  searchByNameVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class SearchByNameVC: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var database: [CustomerData] = []
    var modifiedDatabase: [CustomerData] = []
    var searchString: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        textField.delegate = self
        
        database = CustomerDatabase.getAllCustomers()
        
        modifiedDatabase = database.sorted(by: { $0.customerLast < $1.customerLast })
        
    }
    
    func updateTable(letters: String) {
        let letters = letters.lowercased()
        modifiedDatabase = []
        for currentCustomer in database {
            if currentCustomer.customerFirst.lowercased().starts(with: letters) || currentCustomer.customerLast.lowercased().starts(with: letters) {
                modifiedDatabase.append(currentCustomer)
            }
        }
        print(modifiedDatabase)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modifiedDatabase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell.textLabel?.text = "\(modifiedDatabase[indexPath.row].customerLast!), \(modifiedDatabase[indexPath.row].customerFirst!)"
            return cell
        }
        return UITableViewCell()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != "" {
            searchString += string
        } else {
            let index = searchString.index(before: searchString.endIndex)
            searchString = "\(searchString.prefix(upTo: index))"
        }
        updateTable(letters: searchString)
        tableView.reloadData()
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let firstName = modifiedDatabase[indexPath.row].customerFirst,
            let lastName = modifiedDatabase[indexPath.row].customerLast {
            customer = CustomerDatabase.getCustomerByName(first: firstName, last: lastName)
            self.performSegue(withIdentifier: "searchByNameToCars", sender: nil)
        }
    }
}
