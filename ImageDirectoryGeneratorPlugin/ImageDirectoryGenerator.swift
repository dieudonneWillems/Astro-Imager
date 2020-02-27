//
//  ImageDirectoryGenerator.swift
//  ImageDirectoryGeneratorPlugin
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit
import AstroImager
import AstroImagerPlugin

public class ImageDirectoryGenerator : Generator {
    
    public let name: String
    
    private var navigatorController : DirectoryNavigatorController?
    private var inspectorController : DirectoryInspectorController?
    
    public var navigatorCellView : NSView? {
        get {
            if navigatorController != nil {
                return navigatorController!.view
            }
            navigatorController = DirectoryNavigatorController()
            let bundle = Bundle(for: ImageDirectoryGenerator.self)
            let nib = NSNib.init(nibNamed: "DirectoryNavigatorCell", bundle: bundle)
            if nib == nil {
                return nil
            }
            nib!.instantiate(withOwner: navigatorController!, topLevelObjects: nil)
            return navigatorController?.view
        }
    }
    
    public var inspectorView : NSView? {
        get {
            if inspectorController != nil {
                return inspectorController!.view
            }
            inspectorController = DirectoryInspectorController()
            let bundle = Bundle(for: ImageDirectoryGenerator.self)
            let nib = NSNib.init(nibNamed: "DirectoryInspectorView", bundle: bundle)
            nib!.instantiate(withOwner: inspectorController!, topLevelObjects: nil)
            return inspectorController?.view
        }
    }
    
    public private(set) var progress: Float = 0.0
    
    public init(name: String) {
        self.name = name
    }
    
    public func configure(with properties: [String : Any]) {
        
    }
    
    public func process(on images: ImageSet) {
        
    }
    
    public var output: ImageSet? = nil
    
    
}
