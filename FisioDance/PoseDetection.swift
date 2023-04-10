//
//  PoseDetection.swift
//  FisioDance
//
//  Created by sofiadinizms on 05/04/23.
//

/*The first step is to create a request handler.
Here we are using the ImageRequestHandler.
The next step is to create the request.
In this case, use a VNDetectHumanHandPoseRequest.
The next step is to provide the request to the handler via a call to performRequests.
Once that completes successfully, you will have your observations in the requests results property.
In this case, VNRecognizedPointsObservation are returned.
The observations contain locations for all the found landmarks for the hand.
These are given in new classes meant to represent 2D points. */

//import ARKit
//import RealityKit
//import SwiftUI
//import Vision
//
//struct ARViewContainer: UIViewRepresentable{
//    typealias UIViewType = ARView
//
//    func makeUIView(context: Context) -> ARView {
//        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
//        arView.session.run(ARFaceTrackingConfiguration())
//        return arView
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {
//
//    }
//
//
//}

//extension ARView: ARSessionDelegate {
//    func setupForBodyTracking() {
//        let configuration = ARBodyTrackingConfiguration()
//        self.session.run(configuration)
//
//        self.session.delegate = self
//    }
//
//    public func session(_ session: ARSession){
//
//    }
//
//}
