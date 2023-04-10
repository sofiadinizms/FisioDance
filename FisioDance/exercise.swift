//
//  exercise.swift
//  cameraApp
//
//  Created by sofiadinizms on 09/04/23.
//

import Foundation

public struct Exercise: Identifiable {
    let name: Int
    let duration: Int
    var position: CGFloat
    public var id: Int { name }
}
