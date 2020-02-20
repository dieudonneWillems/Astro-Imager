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
    
    var generator : Generator {get}
    var transformers : [Transformer] {get}
    var serializers : [Serializer] {get}
}
