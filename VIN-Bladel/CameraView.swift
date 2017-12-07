//
//  CameraView.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 12/7/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CameraView: UIView {
    override class var layerClass: AnyClass {
        get {
            return AVCaptureVideoPreviewLayer.self
        }
    }
    
    override var layer: AVCaptureVideoPreviewLayer {
        get {
            return super.layer as! AVCaptureVideoPreviewLayer
        }
    }
}
