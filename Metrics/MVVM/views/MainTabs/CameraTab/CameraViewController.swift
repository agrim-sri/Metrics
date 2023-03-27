//
//  ViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 28/01/23.
//

import UIKit
import RealityKit
import ARKit
import SwiftUI


class CameraViewController: UIViewController, ARSCNViewDelegate, SCNSceneRendererDelegate {
    
    
    @IBOutlet weak var containerRoomCaptureView: UIView!
    @IBOutlet weak var containerMeasureView: UIView!
    @IBOutlet var arView: ARView!
    @IBOutlet weak var shareButton: UIButton!
    //ARKit
    let sessionConfiguration = ARWorldTrackingConfiguration()
//    guard let referenceObjects = ARReferenceObject.referenceObjects(inGroupNamed: "gallery", bundle: nil) else {
//        fatalError("Message expected asset catalog resource.")
//    }
//    sessionConfiguration.detectionObjects = referenceObjects
//    sceneView.session.run(sessionConfiguration)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
        setUp()
        }
    
    func setUp() {
        containerMeasureView.isHidden = true
        containerRoomCaptureView.isHidden = true
    }
    
    @IBAction func didTapSegment(_ sender: UISegmentedControl) {
        containerMeasureView.isHidden = true
        containerRoomCaptureView.isHidden = true
        
        if sender.selectedSegmentIndex == 0 {
            containerMeasureView.isHidden = true
            containerRoomCaptureView.isHidden = true
        }
        else if sender.selectedSegmentIndex == 1 {
            containerMeasureView.isHidden = false
            containerRoomCaptureView.isHidden = true
        }
        else {
            containerMeasureView.isHidden = true
            containerRoomCaptureView.isHidden = false
        }
    }
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        let shareText = "Check out this cool thing I found!"
            let shareURL = URL(string: "https://www.example.com/cool-thing")!

            let activityViewController = UIActivityViewController(activityItems: [shareText, shareURL], applicationActivities: nil)

            present(activityViewController, animated: true, completion: nil)
    }
    
    @IBSegueAction func showSwiftUi(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView(model: CameraViewModel()))
    }
}

