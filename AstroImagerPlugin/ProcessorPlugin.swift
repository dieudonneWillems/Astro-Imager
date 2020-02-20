//
//  ProcessorPlugin.swift
//  AstroImagerPlugin
//
//  Created by Don Willems on 18/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit

public protocol ProcessorPlugin : AstroImagerPlugin {
    
    var navigatorCellView : NSView? {get}
    var inspectorView : NSView? {get}
}
