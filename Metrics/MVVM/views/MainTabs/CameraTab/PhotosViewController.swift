//
//  PhotosViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 23/03/23.
//

import UIKit
import AVFoundation
import CoreMotion
import PhotosUI

class PhotosViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    // AVFoundation variables
    var captureSession: AVCaptureSession!
    var photoOutput: AVCapturePhotoOutput!

    // Core Motion variables
    var motionManager: CMMotionManager!

    // Arrays to hold captured data
    var depthDataArray: [AVDepthData] = []
    var gravityDataArray: [CMAcceleration] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up AVFoundation capture session
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo

        // photoOutput.isDepthDataDeliveryEnabled = true

        // Set up AVCaptureDevice for the back camera
        guard let backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Unable to access back camera.")
            return
        }

        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            photoOutput = AVCapturePhotoOutput()

            // Add input and output to the capture session
            if captureSession.canAddInput(input) && captureSession.canAddOutput(photoOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(photoOutput)

                // Set photo settings for capturing depth data
                let photoSettings = AVCapturePhotoSettings()
                photoSettings.isDepthDataDeliveryEnabled = true
                photoSettings.embedsDepthDataInPhoto = true

                // Start the capture session
                DispatchQueue.global(qos: .userInitiated).async {
                    self.captureSession.startRunning()
                }


                // Configure Core Motion manager to get gravity data
                motionManager = CMMotionManager()
                motionManager.accelerometerUpdateInterval = 0.2

                // Start Core Motion updates to get gravity data
                motionManager.startAccelerometerUpdates(to: .main, withHandler: { (accelerometerData, error) in
                    guard let acceleration = accelerometerData?.acceleration else {
                        return
                    }

                    self.gravityDataArray.append(acceleration)
                })

                // Capture a photo with depth and gravity data
                photoOutput.capturePhoto(with: photoSettings, delegate: self)
            }
        } catch {
            print("Error setting up capture session: \(error.localizedDescription)")
        }
    }

    // AVCapturePhotoCaptureDelegate function to handle captured photo with depth data
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo with depth data: \(error.localizedDescription)")
            return
        }

        // Add depth data to the array
        guard let depthData = photo.depthData else {
            print("Unable to get depth data from photo.")
            return
        }

        self.depthDataArray.append(depthData)

        // Stop Core Motion updates
        motionManager.stopAccelerometerUpdates()

        // Stop the capture session
        captureSession.stopRunning()

        // Do something with the captured data, such as passing it to a RealityKit Object Capture session
        // ...
    }
}
