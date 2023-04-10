//
//  ARViewModel.swift
//  cameraApp
//
//  Created by sofiadinizms on 09/04/23.
//


import Foundation
import RealityKit
import ARKit


class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {
    @Published private var model : ARModel = ARModel()
    
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
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        model.updateHeadTilt()
    }
    
}
