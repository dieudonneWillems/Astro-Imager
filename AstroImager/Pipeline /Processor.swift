//
//  Processor.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit

public protocol Processor {
    
    var identifier: UUID {get}
    var componentIdentifier: UUID {get}
    
    var progress: Float {get}
    
    func configure(with properties: [String: Any])
    func process(on images: ImageSet)
    
    var output : ImageSet? {get}
}

