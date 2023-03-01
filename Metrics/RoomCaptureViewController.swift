//
//  RoomCaptureViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 28/02/23.
//

import UIKit
import RealityKit
import RoomPlan
import ARKit

class RoomCaptureViewController: UIViewController, RoomCaptureViewDelegate, RoomCaptureSessionDelegate {

    @IBOutlet weak var arView: ARView!
    //var previewVisualizer: Visualizer!
    
    var roomBuilder = RoomBuilder(options: [.beautifyObjects])
     
    lazy var captureSession: RoomCaptureSession = {
        let captureSession = RoomCaptureSession()
        arView.session = captureSession.arSession
        
        return captureSession
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captureSession.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //MARK: Session
    
    func captureSession(_ session: RoomCaptureSession, didUpdate room: CapturedRoom) {
        //previewVisualizer.update(model: room)
    }
    
    func captureSession(_ session: RoomCaptureSession, didProvide instruction: RoomCaptureSession.Instruction) {
        //previewVisualizer.provide(instruction)
    }

    
    //MARK: Delegate
    
    func captureSession(_ session: RoomCaptureSession, didEndWith data: CapturedRoomData, error: Error?) {
        if let error = error {
            print("Error: \(error)")
        }
        Task {
            let finalRoom = try! await roomBuilder.capturedRoom(from: data)
            //previewVisualizer.update(model: finalRoom)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
