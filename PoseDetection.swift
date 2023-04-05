//
//  PoseDetection.swift
//  FisioDance
//
//  Created by sofiadinizms on 05/04/23.
//

import Foundation
import SwiftUI
import ARKit
import Vision

//camera providing string of frames, vision request to detect the location and key points of the hands in the frame (VNDetectHumanHandRequest, returns a VNHumandHandPoseObservation for each hand it finds in the frame. this is sent to the ML model in the format of a MLMultiArray. the model also receives a property from the HumanHandPoseObservation called keypoinsMultiArray. Model returns the top prediction for the hand pose with its confidence score, in the format: ["Two": 0.86])

func session(_ session: ARSession, didUpdate frame: ARFrame){
    
    let pixelBuffer = frame.capturedImage
    let handPoseRequest = VNDetectHumanHandPoseRequest()
    handPoseRequest.maximumHandCount = 1
    handPoseRequest.revision = VNDetectHumanHandPoseRequestRevision1
    
    let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
    do {
        try handler.perform([VNDetectHumanBodyPoseRequest()])
    } catch {
        assertionFailure("Human Pose Request Failed: \(error)")
    }
    
    guard let handPoses = request.result, !handPoses.isEmpty else {
        return
    }
    
    let handObservation = handPoses.first
}

if frameCounter % handPosePredictionInterval == 0 {
    guard ler
}
