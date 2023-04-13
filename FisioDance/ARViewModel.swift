//
//  ARViewModel.swift
//  cameraApp
//
//  Created by sofiadinizms on 09/04/23.
//


import Foundation
import RealityKit
import ARKit
import Vision
import SwiftUI


class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {
    @Published private var model : ARModel = ARModel()
    @ObservedObject var settings =  Settings.shared
    
//    public var result: String = "oi"
    
    
    let handModel = try! HandPoseClassifierComplete(configuration: MLModelConfiguration())
    
    var frameCount: Int = 0
    
    var arView : ARView {
        model.arView
    }
    
    var handTilt: Float {
        model.handTilt
    }
    
    var tiltLeft: Bool {
        if handTilt > 0.5 {
            return true
        } else {
            return false
        }
    }
    
    var tiltRight: Bool {
        if handTilt < -0.5 {
            return true
        } else {
            return false
        }
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        model.updateHeadTilt()
        frameCount += 1
        
        
        if frameCount % 5 == 0 {
            let pixelBuffer = frame.capturedImage
            
            let handPoseRequest = VNDetectHumanHandPoseRequest()
            handPoseRequest.maximumHandCount = 2
            handPoseRequest.revision = VNDetectHumanHandPoseRequestRevision1
            
            let request = VNDetectHumanBodyPoseRequest()
            
            let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
            
            do {
                try handler.perform([request, handPoseRequest])
            } catch {
                assertionFailure("Human Pose Request Failed: \(error)")
            }
            
            
            if let handPoses = handPoseRequest.results,
               !handPoses.isEmpty,
               let handObservation = handPoses.first,
               frameCount % Int(handObservation.confidence) == 0 {
                
                guard let keypointsMultiArray = try? handObservation.keypointsMultiArray() else { fatalError() }
                
                do{
                    let handPosePrediction = try handModel.prediction(poses: keypointsMultiArray)
                    let confidence = handPosePrediction.labelProbabilities[handPosePrediction.label]!
                    
                    if confidence > 0.8 {
                        print("\(handPosePrediction.label)")
                        settings.result = handPosePrediction.label
                    }
                    
                } catch {
                    print(error)
                }
        }
        
            
            
        }

            
            
        
        
        
//        for anchor in anchors {
//
//            guard let faceAnchor = anchor as? ARFaceAnchor else { continue }
//            guard let frame = session.currentFrame else { continue }
//            let pixelBuffer = frame.capturedImage
//
//            let request = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
//            let handler = VNImageRequestHandler(ciImage: CVImageBuffer, orientation: .left)
//
//            let jointNames = ["thumbTip", "indexTip", "middleTip", "ringTip", "littleTip"]
//
//            do {
////                try handler.perform([self.])
//                guard let observations = request.results as? [VNRecognizedPointsObservation], !observations.isEmpty else { return }
//                let observation = observations[0]
//
//                var points: [String: CGPoint] = [:]
//                for jointName in jointNames {
//                    guard let joint = observation.joints[VNHumanHandPoseObservation.JointName(rawValue: jointName)] else { continue }
//                    let point = CGPoint(x: CGFloat(joint.location.x), y: CGFloat(joint.location.y))
//                    points[jointName] = point
//                }
//
//                let prediction = try? parent.handPoseClassifier.prediction(thumbTip: points["thumbTip"]!, indexTip: points["indexTip"]!, middleTip: points["middleTip"]!, ringTip: points["ringTip"]!, littleTip: points["littleTip"]!)
//
//                // do something with the prediction (e.g. update UI, add 3D object to scene, etc.)
//
//            } catch {
//                print(error)
//            }
//        }
        
        //        func updateCoreML() {
        //            let pixbuff : CVPixelBuffer? = frame.capturedImage
        //            if pixbuff == nil { return }
        //
        //            let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixbuff!, orientation: .left,options: [:])
        //            do {
        //                try imageRequestHandler.perform(GameView.visionRequests)
        //            } catch {
        //                print(error)
        //            }
        //
        //        }
        
        //
        //        let pixelBuffer = frame.capturedImage
        //        let handPoseRequest = VNDetectHumanHandPoseRequest()
        //        handPoseRequest.maximumHandCount = 1
        //        handPoseRequest.revision = VNDetectHumanHandPoseRequestRevision1
        //
        //        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        //        do {
        //            try handler.perform([handPoseRequest])
        //        } catch {
        //            assertionFailure("Human Pose Request failed: \(error)")
        //        }
        //
        //        guard let handPoses = handPoseRequest.results, !handPoses.isEmpty else {
        //            // No effects to draw, so clear out current graphics
        //            return
        //        }
        //        let handObservation = handPoses.first
        //
        //        if frameCounter % handPosePredictionInterval == 0 {
        //
        //            guard let keypointsMultiArray = try? handObservation!.keypointsMultiArray()
        //        else { fatalError() }
        //            let handPosePrediction = try HandPoseClassifier.prediction()
        //            let confidence = handPosePrediction.labelProbabilities[handPosePrediction.label]!
        //
        //            if confidence > 0.9 {
        //               renderHandPoseEffect(name: handPosePrediction.label)
        //            }
        //
    }
}
