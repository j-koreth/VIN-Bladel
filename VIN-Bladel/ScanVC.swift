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
    @IBOutlet weak var confrimButton: UIButton!
    
//    var cameraView: CameraView!
    let session = AVCaptureSession()
    let sessionQueue = DispatchQueue(label: AVCaptureSession.self.description(), attributes: [], target: nil)
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?

    
    
//    override func loadView()
//    {
//        cameraView = CameraView()
//
//        view = cameraView
//    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
//            }
//        }
        
        session.commitConfiguration()
        
//        cameraView.layer.session = session
//        cameraView.layer.videoGravity = .resizeAspectFill
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        view.bringSubview(toFront: self.barcodeLabel)
        view.bringSubview(toFront: self.confrimButton)
        
        let videoOrientation: AVCaptureVideoOrientation
        switch UIApplication.shared.statusBarOrientation {
        case .portrait:
            videoOrientation = .portrait
            
        case .portraitUpsideDown:
            videoOrientation = .portraitUpsideDown
            
        case .landscapeLeft:
            videoOrientation = .landscapeLeft
            
        case .landscapeRight:
            videoOrientation = .landscapeRight
            
        default:
            videoOrientation = .portrait
        }
        videoPreviewLayer?.connection?.videoOrientation = videoOrientation
        
//        cameraView.layer.connection?.videoOrientation = videoOrientation
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sessionQueue.async {
            self.session.startRunning()
//           view.bringSubview(toFront: self.barcodeLabel)
//            view.bringSubview(toFront: self.confrimButton)
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sessionQueue.async {
            self.session.stopRunning()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        // Update camera orientation
        let videoOrientation: AVCaptureVideoOrientation
        switch UIDevice.current.orientation {
        case .portrait:
            videoOrientation = .portrait

        case .portraitUpsideDown:
            videoOrientation = .portraitUpsideDown

        case .landscapeLeft:
            videoOrientation = .landscapeRight

        case .landscapeRight:
            videoOrientation = .landscapeLeft

        default:
            videoOrientation = .portrait
        }

        videoPreviewLayer?.connection?.videoOrientation = videoOrientation
    }
    
    func segue() {
        self.performSegue(withIdentifier: "segueToManual", sender: self)
    }
    
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if (metadataObjects.count > 0 && metadataObjects.first is AVMetadataMachineReadableCodeObject) {
            let scan = metadataObjects.first as! AVMetadataMachineReadableCodeObject
            barcode = scan.stringValue!
            barcodeLabel.text = barcode
            carData = VINData(vinNumber: barcode)

//            let alertController = UIAlertController(title: "Barcode Scanned", message: scan.stringValue, preferredStyle: .alert)
//
//            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
//
//            present(alertController, animated: true, completion: nil)
            
            
        }
        if metadataObjects.count == 0 {
            barcodeLabel.text = "No barcode is detected"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destination = segue.destination as? InputVC {
            destination.car = carData! // you can pass value to destination view controller
        }
        
    }
    
}

