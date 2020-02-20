//
//  Document.swift
//  Astro Imager
//
//  Created by Don Willems on 14/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Cocoa

class Project: NSPersistentDocument {

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }
    
    @IBAction func runPipeline(_ sender: Any) {
        Swift.print("Start Pipeline...")
    }
    
    override class var autosavesInPlace: Bool {
        return true
    }

    override var windowNibName: NSNib.Name? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return NSNib.Name("Project")
    }

}
