//
//  ScanVC.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 12/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation

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
        confirmButton.tintColor = UIColor.white
        confirmButton.setTitleTextAttributes([ NSAttributedStringKey.font: UIFont(name: "Arial", size: 20)!], for: UIControlState.normal)

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
            barcode = scan.stringValue!
            confirmButton.isEnabled = true
            confirmButton.tintColor = UIColor.white

            barcodeLabel.textColor = UIColor.green
            barcodeLabel.text = barcode
            carData = VINData(vinNumber: barcode)
            
            
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
        print("Seguing")
        self.performSegue(withIdentifier: "segue", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destination = segue.destination as? CarInfoViewController {
            destination.car = carData
        }
        
    }
    
}

