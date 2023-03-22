//
//  MeasureViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 06/03/23.
//

import UIKit
import RealityKit
import ARKit
//import ObjectCapture

class ViewController: UIViewController {
    
    var objectCaptureSession: ARObjectCaptureSession?
    var objectScanningConfiguration: ARObjectScanningConfiguration?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arView = ARView(frame: self.view.frame)
        self.view.addSubview(arView)
        
        // Create an instance of the ARObjectScanningConfiguration class
        objectScanningConfiguration = ARObjectScanningConfiguration()
        
        // Create an instance of the ARObjectCaptureSession class with the configuration
        objectCaptureSession = ARObjectCaptureSession(configuration: objectScanningConfiguration!)
        
        // Start the scanning process
        objectCaptureSession?.run()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the scanning process when the view disappears
        objectCaptureSession?.pause()
    }
    
    func objectCaptureSession(_ session: ARObjectCaptureSession, didOutputMeshAnchor meshAnchor: ARMeshAnchor) {
        
        // Convert the mesh to a RealityKit mesh
        let realityKitMesh = meshAnchor.geometry.mesh
        
        // Create a RealityKit entity from the mesh
        let entity = ModelEntity(mesh: realityKitMesh)
        
        // Add the entity to the scene
        arView.scene.addAnchor(entity)
    }
}
