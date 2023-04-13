//
//  ARModel.swift
//  cameraApp
//
//  Created by sofiadinizms on 09/04/23.
//


import Foundation
import RealityKit
import ARKit

struct ARModel {
    private(set) var arView : ARView
    
    var handTilt: Float = 0
    
    init() {
        
        arView = ARView(frame: .zero)
        arView.session.run(ARFaceTrackingConfiguration())
        
        let handAnchor = AnchorEntity(.face)
        handAnchor.name = "handAnchor"
        arView.scene.addAnchor(handAnchor)
        
        let cameraAnchor = AnchorEntity(.camera)
        cameraAnchor.name = "cameraAnchor"
        arView.scene.addAnchor(cameraAnchor)
    }
    
    mutating func updateHeadTilt() {
        
        let handAnchor = arView.scene.anchors.first(where: {$0.name == "handAnchor" })
        let cameraAnchor = arView.scene.anchors.first(where: {$0.name == "cameraAnchor" })
        
        handTilt = handAnchor?.orientation(relativeTo: cameraAnchor).axis.z ?? 0
    }
    
}

