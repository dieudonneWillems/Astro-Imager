//
//  ImageDirectoryGeneratorPlugin.swift
//  ImageDirectoryGeneratorPlugin
//
//  Created by Don Willems on 21/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit
import AstroImager
import AstroImagerPlugin

public class ImageDirectoryGeneratorPlugin : AstroImagerPlugin {
    
    public var isLoaded: Bool {
        get {
            return meta != nil
        }
    }
    
    public var meta: MetaPlugin?
    
    public required init() {
        meta = MetaPlugin(principialClass: ImageDirectoryGenerator.self)
    }
    
    public var processors : [Processor] {
        get {
            var procs = [Processor]()
            procs.append(ImageDirectoryGenerator(name: "Image Folder"))
            return procs
        }
    }
    
    public private(set) var progress: Float = 0.0
    
    public func configure(with properties: [String : Any]) {
        
    }
    
    public func process(on images: ImageSet) {
        
    }
    
    public var output: ImageSet? = nil
    
    
}
