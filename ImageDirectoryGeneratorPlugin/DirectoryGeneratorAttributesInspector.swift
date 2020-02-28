//
//  DirectoryGeneratorPropertyInspector.swift
//  ImageDirectoryGeneratorPlugin
//
//  Created by Don Willems on 19/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit

public class DirectoryGeneratorAttributesInspector {
    
    // I want to be sure that the view is retained after being removed from the superView
    // so that it can be reused.
    // Therefore, a strong outlet to view
    @IBOutlet var view: NSView!
    
    @IBOutlet weak var pathLabel: NSTextField!
    
    @IBAction func showInFinderClicked(_ sender: Any) {
    }
    
    @IBOutlet weak var baseFolderPUB: NSPopUpButton!
    
    @IBAction func baseFolderChanged(_ sender: Any) {
    }
    
    @IBOutlet weak var lightFramesPUB: NSPopUpButton!
    
    @IBAction func lightFramesChanged(_ sender: Any) {
    }
    
    @IBOutlet weak var flatFramesPUB: NSPopUpButton!
    
    @IBAction func flatFramesChanged(_ sender: Any) {
    }
    
    @IBOutlet weak var biasFramesPUB: NSPopUpButton!
    
    @IBAction func biasFramesChanged(_ sender: Any) {
    }
    
    @IBOutlet weak var darkFramesPUB: NSPopUpButton!
    
    @IBAction func darkFramesChanged(_ sender: Any) {
    }
}
