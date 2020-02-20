//
//  ImageSet.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation

public struct ImageSet {
    
    public var subSets : [ImageSet] {
        get {
            return _subSets
        }
    }
    
    private var _subSets = [ImageSet]()
    
    public var images : [AstroImage] {
        get {
            return _images
        }
    }
    
    private var _images = [AstroImage]()
    
}
