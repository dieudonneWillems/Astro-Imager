//
//  NavigationController.swift
//  Astro Imager
//
//  Created by Don Willems on 21/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import AppKit
import AstroImager
import AstroImagerPlugin

public enum NavigationMode : String {
    case pipeline
    case devices
    case images
    case objects
    case processes
}

public struct NavigationNotification {
    public static let navigationSelectionDidChange = Notification.Name("navigationSelectionDidChange")
}

public class NavigationController : NSObject, NSOutlineViewDelegate, NSOutlineViewDataSource {
    
    public var selectedItem : Any? = nil
    
    public var mode : NavigationMode = .pipeline {
        willSet(newValue) {
            print("Setting Navigation Controller mode to: \(newValue.rawValue)")
        }
    }
    
    public var pipeline: Pipeline? = nil {
        didSet(oldValue) {
            if mode == .pipeline {
                navigationView.reloadData()
            }
        }
    }
    
    private var numberOfProcessorsInPipeline : Int {
        get {
            if pipeline == nil {
                return 0
            }
            return pipeline!.generators.count + pipeline!.transformers.count + pipeline!.serializers.count
        }
    }
    
    private func processor(at index: Int) -> Processor? {
        if pipeline == nil || index < 0 {
            return nil
        }
        var movingIndex = index
        if movingIndex < pipeline!.generators.count {
            return pipeline!.generators[movingIndex]
        }
        movingIndex = movingIndex - pipeline!.generators.count
        if movingIndex < pipeline!.transformers.count {
            return pipeline!.transformers[movingIndex]
        }
        movingIndex = movingIndex - pipeline!.transformers.count
        if movingIndex < pipeline!.serializers.count {
            return pipeline!.serializers[movingIndex]
        }
        return nil
    }
    
    @IBOutlet weak var navigationView: NSOutlineView!
    
    
    public override func awakeFromNib() {
        self.mode = .pipeline
    }
    
    public func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if mode == .pipeline && pipeline != nil {
            return self.processor(at: index)!
        }
        return ""
    }
    
    public func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
    
    public func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if mode == .pipeline && pipeline != nil {
            return self.numberOfProcessorsInPipeline
        }
        return 0
    }
    
    public func outlineView(_ outlineView: NSOutlineView, objectValueFor tableColumn: NSTableColumn?, byItem item: Any?) -> Any? {
        return ""
    }
    
    // MARK: - Delegate methods
    
    public func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        if mode == .pipeline {
            if (item as? Processor) != nil {
                let processor = item as! Processor
                let appDelegate = NSApplication.shared.delegate as? AppDelegate
                let component = appDelegate?.processorComponent(with: processor.componentIdentifier)
                if component != nil {
                    let cell = component!.navigatorCellView
                    
                    return cell
                }
            }
        }
        return nil
    }
    
    public func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        return 35.0
    }
    
    public func outlineViewSelectionDidChange(_ notification: Notification) {
        let row = navigationView.selectedRow
        selectedItem = navigationView.item(atRow: row)
        NotificationCenter.default.post(Notification(name: NavigationNotification.navigationSelectionDidChange, object: self, userInfo: nil))
    }
}
