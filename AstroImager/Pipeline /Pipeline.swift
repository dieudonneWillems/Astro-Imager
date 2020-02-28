//
//  Pipeline.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit

public protocol Pipeline {
    
    var name : String {get}
    var description : String {get}
    var icon : NSImage {get}
    
    var generators : [Generator] {get}
    var transformers : [Transformer] {get}
    var serializers : [Serializer] {get}
    
    func add(generatorFromComponent identifier: UUID)
    
    func remove(generatorAt index: Int)
    
    func add(transformerFromComponent identifier: UUID)
    
    func remove(transformerAt index: Int)
    
    func add(serializerFromComponent identifier: UUID)
    
    func remove(serializerAt index: Int)
    
    var isRunning : Bool {get}
    
    func load() -> Bool
    
    func run() -> Bool
    
    func stop()
}
