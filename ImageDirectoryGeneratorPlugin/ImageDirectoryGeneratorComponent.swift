//
//  ImageDirectoryGeneratorComponent.swift
//  ImageDirectoryGeneratorPlugin
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit
import AstroImager
import AstroImagerPlugin

public class ImageDirectoryGeneratorComponent : GeneratorComponent {
    
    public let identifier: UUID
    
    public let name: String
    
    private var navigatorController : DirectoryNavigatorController?
    private var inspectorController : DirectoryGeneratorAttributesInspector?
    
    public func instantiateGenerator() -> Generator {
        let generator = ImageDirectoryGenerator(createdBy: self.identifier)
        return generator
    }
    
    public func instantiateProcessor() -> Processor {
        return self.instantiateGenerator()
    }
    
    public var navigatorCellView : NSView? {
        get {
            if navigatorController != nil {
                return navigatorController!.view
            }
            navigatorController = DirectoryNavigatorController()
            let bundle = Bundle(for: ImageDirectoryGeneratorComponent.self)
            let nib = NSNib.init(nibNamed: "DirectoryNavigatorCell", bundle: bundle)
            if nib == nil {
                return nil
            }
            nib!.instantiate(withOwner: navigatorController!, topLevelObjects: nil)
            return navigatorController?.view
        }
    }
    
    public var identityInspectorView : NSView? {
        get {
            return nil
        }
    }
    
    public var atributesInspectorView : NSView? {
        get {
            if inspectorController != nil {
                return inspectorController!.view
            }
            inspectorController = DirectoryGeneratorAttributesInspector()
            let bundle = Bundle(for: ImageDirectoryGeneratorComponent.self)
            let nib = NSNib.init(nibNamed: "DirectoryInspectorView", bundle: bundle)
            nib!.instantiate(withOwner: inspectorController!, topLevelObjects: nil)
            return inspectorController?.view
        }
    }
    public var historyInspectorView : NSView? {
        get {
            return nil
        }
    }
    
    public var quickHelpInspectorView : NSView?{
        get {
            return nil
        }
    }
    
    public init(name: String) {
        self.name = name
        self.identifier = UUID()
    }
}
