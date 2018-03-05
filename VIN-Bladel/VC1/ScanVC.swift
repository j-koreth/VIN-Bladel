//
//  ScanVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 12/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation
import FirebaseDatabase

class ScanVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate
{
    var barcode = ""
    var carData: VehicleData?
    var customer: CustomerData?
    
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    let session = AVCaptureSession()
    let sessionQueue = DispatchQueue(label: AVCaptureSession.self.description(), attributes: [], target: nil)
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
   
    override func viewDidLoad() {
        super.viewDidLoad()
                
        confirmButton.isEnabled = false
        confirmButton.tintColor = UIColor.lightGray

        self.navigationItem.rightBarButtonItem? = confirmButton

        session.beginConfiguration()
        
        let videoDevice = AVCaptureDevice.default(for: .video)
        
//        if (videoDevice != nil) {
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!)
            
//            if (videoDeviceInput != nil) {
//                if (session.canAddInput(videoDeviceInput!)) {
                    session.addInput(videoDeviceInput!)
//                }
//            }
        
            let metadataOutput = AVCaptureMetadataOutput()
            
//            if (session.canAddOutput(metadataOutput)) {
                session.addOutput(metadataOutput)
                
                metadataOutput.metadataObjectTypes = [
                    .upce,
                    .ean8,
                    .ean13,
                    .code39,
                    .code39Mod43,
                    .code128,
                    .itf14,
                    .code93,
                    .qr,
                    .dataMatrix,
                    .pdf417,
                    .aztec,
                    .face,
                    .interleaved2of5
                ]
                
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        session.commitConfiguration()
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        videoPreviewLayer?.videoGravity = .resizeAspectFill
        videoPreviewLayer?.frame = view.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        view.bringSubview(toFront: self.barcodeLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        carData = nil
        barcodeLabel.text = "No barcode is detected"
        barcodeLabel.textColor = .white
        sessionQueue.async {
            self.session.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sessionQueue.async {
            self.session.stopRunning()
        }
    }
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if (metadataObjects.count > 0 && metadataObjects.first is AVMetadataMachineReadableCodeObject) {
            let scan = metadataObjects.first as! AVMetadataMachineReadableCodeObject
            
            if scan.stringValue?.first == "I"
            {
                var imported: String = scan.stringValue!
                imported.remove(at: (scan.stringValue?.startIndex)!)
                barcode = imported
            }
            else
            {
                barcode = scan.stringValue!
            }
            while(carData == nil){
                carData = VehicleDatabase.searchByVIN(vin: barcode)
            }
            confirmButton.isEnabled = true
            confirmButton.tintColor = UIColor.white
            
            barcodeLabel.textColor = UIColor(red:0.31, green:0.63, blue:0.46, alpha:1.0)
            barcodeLabel.text = barcode
        }
        
        if metadataObjects.count == 0 {
            confirmButton.isEnabled = false
            confirmButton.tintColor = UIColor(red:0.71, green:0.76, blue:0.80, alpha:1.0)
            barcodeLabel.textColor = UIColor.white
            barcodeLabel.text = "No barcode is detected"
        }
    }
    
    @IBAction func segueToCarInfo(_ sender: Any)
    {
        
        session.stopRunning()
        confirmButton.tintColor = UIColor.lightGray
        
        if (self.carData?.error != nil) {
            let alert = UIAlertController(title: "Error", message: carData?.error, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            session.startRunning()
            confirmButton.tintColor = UIColor.white
        }
        else {
            if (carData?.fromDatabase)!
            {
                customer = customerArray.customerArray.getCustomerByID(ID: (carData?.vehicleCustomerID)!)
                self.performSegue(withIdentifier: "scanToCarInfo", sender: nil)
            }
            else
            {
                self.performSegue(withIdentifier: "scanNotFound", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destination = segue.destination as? CarInfoViewController
        {
            destination.car = carData
            destination.customer = customer
        }
        
        if let destination = segue.destination as? DataNotFoundViewController
        {
            destination.newCar = carData!
        }
    }
}

