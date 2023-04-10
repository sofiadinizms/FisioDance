//
//  Classifier.swift
//  FisioDance
//
//  Created by sofiadinizms on 09/04/23.
//

import CoreML
import Vision
import CoreImage

struct Classifier {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        guard let model = try? VNCoreMLModel(for: HandPoseClassifier(configuration: MLModelConfiguration()).model) else { return }
        
        let request = VNCoreMLRequest(model: model)
        
//        let handler = VNImageRequestHandler()
    }
}
