//
//  ViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 28/01/23.
//

import UIKit
import SceneKit
import RealityKit
import ARKit


class CameraViewController: UIViewController, ARSCNViewDelegate, SCNSceneRendererDelegate {
    
    @IBOutlet var arView: ARView!
    
    @IBOutlet weak var shareButton: UIButton!
    //ARKit
    
//    guard let referenceObjects = ARReferenceObject.referenceObjects(inGroupNamed: "gallery", bundle: nil) else {
//        fatalError("Message expected asset catalog resource.")
//    }
//    confirguration.detectionObjects = referenceObjects
//    sceneView.session.run(configuration)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let Configuration = ARWorldTrackingConfiguration()
//        Configuration.planeDetection = .horizontal
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        arView.session.run(configuration, options: .resetTracking)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        arView.session.pause()
    }
    
    
    // MARK: UI Button Actions
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        let shareText = "Check out this cool thing I found!"
            let shareURL = URL(string: "https://www.example.com/cool-thing")!

            let activityViewController = UIActivityViewController(activityItems: [shareText, shareURL], applicationActivities: nil)

            present(activityViewController, animated: true, completion: nil)
    }
}
