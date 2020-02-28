//
//  ImageDirectoryGenerator.swift
//  ImageDirectoryGeneratorPlugin
//
//  Created by Don Willems on 27/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AstroImager

public class ImageDirectoryGenerator : Generator {
    
    public var identifier: UUID
    
    public var componentIdentifier: UUID
    
    public var progress: Float
    
    public init(createdBy componentID: UUID) {
        self.identifier = UUID()
        self.componentIdentifier = componentID
        self.progress = 0
    }
    
    public func configure(with properties: [String : Any]) {
        
    }
    
    public func process(on images: ImageSet) {
        
    }
    
    public var output: ImageSet? = nil
    
    
}
