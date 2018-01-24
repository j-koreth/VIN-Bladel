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
    var carData: VINData?
    
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    let session = AVCaptureSession()
    let sessionQueue = DispatchQueue(label: AVCaptureSession.self.description(), attributes: [], target: nil)
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
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
        barcodeLabel.text = "No barcode is detected"
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
    
    func segue() {
        self.performSegue(withIdentifier: "segueToManual", sender: self)
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
            
            carData = VINData(vinNumber: barcode)
            
            confirmButton.isEnabled = true
            confirmButton.tintColor = UIColor.white

            barcodeLabel.textColor = UIColor.green
            barcodeLabel.text = barcode
        }
        
        if metadataObjects.count == 0 {
            confirmButton.isEnabled = false
            confirmButton.tintColor = UIColor.lightGray
            barcodeLabel.textColor = UIColor.white
            barcodeLabel.text = "No barcode is detected"
        }
    }
    
    @IBAction func segueToCarInfo(_ sender: Any)
    {
        session.stopRunning()
        confirmButton.tintColor = UIColor.lightGray
//        let when = DispatchTime.now() + 2
//        DispatchQueue.main.asyncAfter(deadline: when) {
            self.performSegue(withIdentifier: "segue", sender: nil)
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(carData?.error != nil){
            let alert = UIAlertController(title: "ERROR", message: carData?.error, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            if let destination = segue.destination as? CarInfoViewController
            {
                destination.car = carData
            }
        }
    }
}

