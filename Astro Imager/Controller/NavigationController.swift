//
//  NavigationController.swift
//  Astro Imager
//
//  Created by Don Willems on 21/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import AppKit

public enum NavigationMode : String {
    case pipeline
    case devices
    case images
    case objects
    case processes
}

public class NavigationController : NSObject, NSOutlineViewDelegate, NSOutlineViewDataSource {
    
    public var mode : NavigationMode = .pipeline {
        willSet(newValue) {
            print("Setting Navigation Controller mode to: \(newValue.rawValue)")
        }
    }
    
    public override func awakeFromNib() {
        self.mode = .pipeline
    }
}
