//
//  HandPoseClassifier.swift
//  FisioDance
//
//  Created by sofiadinizms on 10/04/23.
//

//import Foundation
//import CoreML
//import Vision
//
//class HandPoseClassifier1 {
//
//    private let handModel: MLModel
//
//    init() {
//        let handModel = try? HandPoseClassifier(configuration: MLModelConfiguration()).model
//    }
//
//    func prediction(poses: MLMultiArray) throws -> HandPoseClassifierOutput {
//        let input = HandPoseClassifierInput(poses: poses)
//        let output = try handModel.prediction(from: input)
//        return output as! HandPoseClassifierOutput
//    }
//
//}
