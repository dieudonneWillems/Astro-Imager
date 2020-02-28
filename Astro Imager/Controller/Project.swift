//
//  Document.swift
//  Astro Imager
//
//  Created by Don Willems on 14/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Cocoa
import AstroImager
import AstroImagerPlugin

class Project: NSPersistentDocument {
    
    var pipeline : Pipeline?

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }
    
    public override func awakeFromNib() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(self.navigationSelectionChanged(sender:)), name: NavigationNotification.navigationSelectionDidChange, object: navigationController)
        Swift.print("Awaking")
        let appDelegate = NSApplication.shared.delegate as? AppDelegate
        if appDelegate != nil {
            appDelegate!.loadPlugins()
            self.pipeline = DefaultPipeline(name: "Basic Image Stacking Pipeline", description: "", icon: NSImage(named: "NSActionTemplate")!)
            (self.pipeline as! DefaultPipeline).pluginProvider = appDelegate
            self.pipeline!.add(generatorFromComponent: (appDelegate?.generatorComponent(name: "Image Folder")?.identifier)!)
            _ = self.pipeline?.load()
            navigationController.pipeline = self.pipeline
        } else {
            self.pipeline = nil
        }
    }
    
    // MARK: - Notifications
    @objc private func navigationSelectionChanged(sender: Any){
    }
    
    // MARK: - Outlets
    @IBOutlet var navigationController: NavigationController!
    @IBOutlet var inspectorController: InspectorController!
    
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
    
    @IBAction func showIdentityInspector(_ sender: Any) {
        inspectorController.mode = .identity
    }
    
    @IBAction func showAttributesInspector(_ sender: Any) {
        inspectorController.mode = .attributes
    }
    
    @IBAction func showHistoryInspector(_ sender: Any) {
        inspectorController.mode = .history
    }
    
    @IBAction func showHelpInspector(_ sender: Any) {
        inspectorController.mode = .help
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
