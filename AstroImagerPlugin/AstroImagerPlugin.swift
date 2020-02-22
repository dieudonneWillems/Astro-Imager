//
//  AstroImagerPlugin.swift
//  AstroImagerPlugin
//
//  Created by Don Willems on 16/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AstroImager

public protocol AstroImagerPlugin {
    
    var isLoaded : Bool {get}
    
    var meta: MetaPlugin? {get}
    
    var processors : [Processor] {get}
    
    init()
    
}
