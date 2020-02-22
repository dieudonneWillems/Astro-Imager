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
    
    // MARK: - Outlets
    @IBOutlet var navigationController: NavigationController!
    
    // MARK: - Actions
    
    @IBAction func runPipeline(_ sender: Any) {
        Swift.print(">> Start Pipeline...")
    }
    
    @IBAction func insertProcessor(_ sender: Any) {
    }
    
    @IBAction func showPipelineNavigator(_ sender: Any) {
        navigationController.mode = .pipeline
    }
    
    @IBAction func showDeviceNavigator(_ sender: Any) {
        navigationController.mode = .devices
    }
    
    @IBAction func showImageNavigator(_ sender: Any) {
        navigationController.mode = .images
    }
    
    @IBAction func showObjectNavigator(_ sender: Any) {
        navigationController.mode = .objects
    }
    
    @IBAction func showProcessNavigator(_ sender: Any) {
        navigationController.mode = .processes
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
