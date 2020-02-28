//
//  ProcessorComponent.swift
//  AstroImagerPlugin
//
//  Created by Don Willems on 27/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit
import AstroImager

public protocol ProcessorComponent {

    var identifier : UUID {get}
    
    var name : String {get}
    
    var navigatorCellView : NSView? {get}
    
    var identityInspectorView : NSView? {get}
    var atributesInspectorView : NSView? {get}
    var historyInspectorView : NSView? {get}
    var quickHelpInspectorView : NSView? {get}
    
    func instantiateProcessor() -> Processor
}
