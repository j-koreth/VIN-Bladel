//
//  LoadingViewController.swift
//  VIN-Bladel
//
//  Created by Will Stiefbold on 1/22/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var array = [UIImage(named: "1")]
    var customerArray = CustomerDB()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    customerArray.pullFromFirebase()
//        print(customerArray.database[0])
//        array.append(UIImage(named: "1")!)
//        array.append(UIImage(named: "2")!)
//        array.append(UIImage(named: "3")!)
//        array.append(UIImage(named: "4")!)
//        array.append(UIImage(named: "5")!)
//        array.append(UIImage(named: "6")!)
//        array.append(UIImage(named: "7")!)
//        array.append(UIImage(named: "8")!)
//        array.append(UIImage(named: "9")!)
//        array.append(UIImage(named: "10")!)
//        array.append(UIImage(named: "11")!)
//        array.append(UIImage(named: "12")!)
//        array.append(UIImage(named: "13")!)
//        array.append(UIImage(named: "14")!)
//        array.append(UIImage(named: "15")!)
//        array.append(UIImage(named: "16")!)
//        array.append(UIImage(named: "17")!)
//        array.append(UIImage(named: "18")!)
//        array.append(UIImage(named: "19")!)
//        array.append(UIImage(named: "20")!)
//        array.append(UIImage(named: "21")!)
//        array.append(UIImage(named: "22")!)
//        array.append(UIImage(named: "23")!)
//        array.append(UIImage(named: "24")!)
//        array.append(UIImage(named: "25")!)
//        array.append(UIImage(named: "26")!)
//        array.append(UIImage(named: "27")!)
//        array.append(UIImage(named: "28")!)
//        array.append(UIImage(named: "29")!)
//        array.append(UIImage(named: "30")!)
//        array.append(UIImage(named: "31")!)
//        array.append(UIImage(named: "32")!)
//        array.append(UIImage(named: "33")!)
//        array.append(UIImage(named: "34")!)
//        array.append(UIImage(named: "35")!)
//        array.append(UIImage(named: "36")!)
//        array.append(UIImage(named: "37")!)
//        array.append(UIImage(named: "38")!)
//        array.append(UIImage(named: "39")!)
//        array.append(UIImage(named: "40")!)
//        array.append(UIImage(named: "41")!)
//        array.append(UIImage(named: "42")!)
//        array.append(UIImage(named: "43")!)
//        array.append(UIImage(named: "44")!)
//        array.append(UIImage(named: "45")!)
//        array.append(UIImage(named: "46")!)
//        array.append(UIImage(named: "47")!)
//        array.append(UIImage(named: "48")!)
//        array.append(UIImage(named: "49")!)
//        array.append(UIImage(named: "50")!)
//        array.append(UIImage(named: "51")!)
//        array.append(UIImage(named: "52")!)
//        array.append(UIImage(named: "53")!)
//        array.append(UIImage(named: "54")!)
//        array.append(UIImage(named: "55")!)
//        array.append(UIImage(named: "56")!)
//        array.append(UIImage(named: "57")!)
//        array.append(UIImage(named: "58")!)
//        array.append(UIImage(named: "59")!)
//        array.append(UIImage(named: "60")!)
        
        
        loops(array: array as! [UIImage])
        
        
    }

    
    func loops(array: [UIImage] )
    {
        
        imageView.image = UIImage.animatedImage(with: array, duration: 2.5)
        
    }
    
    
    
//    func segu()
//    {
//    self.performSegue(withIdentifier: "toBeginningThing", sender: nil)
//
//    }
    
//    func getCustomerByVIN(VIN: String) -> CustomerData
//    {
//        for customer in customerArray
//        {
//            if customer.
//        }
//    }
    

}
