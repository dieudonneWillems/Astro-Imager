//
//  InspectorController.swift
//  Astro Imager
//
//  Created by Don Willems on 28/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit
import AstroImagerPlugin
import AstroImager

public enum InspectorMode : String {
    case identity
    case attributes
    case history
    case help
}

public class InspectorController : NSObject {
    
    @IBOutlet weak var project: Project!
    @IBOutlet weak var inspectorContentView: NSView!
    
    public var mode: InspectorMode = .identity {
        willSet(newValue) {
            print("Setting Inspector Controller mode to: \(newValue.rawValue)")
        }
        didSet(oldValue) {
            changeInspectorView()
        }
    }
    
    public override func awakeFromNib() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(self.navigationSelectionChanged(sender:)), name: NavigationNotification.navigationSelectionDidChange, object: project.navigationController)
    }
    
    private func changeInspectorView() {
        let subviews = inspectorContentView.subviews
        for view in subviews {
            view.removeFromSuperview()
        }
        let selectedItem = project.navigationController.selectedItem
        self.showInspector(for: selectedItem)
    }
    
    private func showInspector(for item: Any?) {
        switch mode {
        case .identity:
            showIdentityInspector(for: item)
        case .attributes:
            showAttributesInspector(for: item)
        case .history:
            showHistoryInspector(for: item)
        case .help:
            showHelpInspector(for: item)
        }
    }
    
    private func showIdentityInspector(for item: Any?) {
        self.showEmptyInspector(with: "No Selection")
    }
    
    private func showAttributesInspector(for item: Any?) {
        if (item as? Processor) != nil {
            let processor = (item as! Processor)
            let inspectorView = (project.pipeline as? DefaultPipeline)?.pluginProvider?.processorComponent(with: processor.componentIdentifier)?.atributesInspectorView
            if inspectorView != nil {
                self.layoutInspectorView(view: inspectorView!)
                return
            }
        }
        self.showEmptyInspector(with: "No Selection")
    }
    
    private func showHistoryInspector(for item: Any?) {
        self.showEmptyInspector(with: "No History")
    }
    
    private func showHelpInspector(for item: Any?) {
        self.showEmptyInspector(with: "No Quick Help")
    }
    
    private func layoutInspectorView(view: NSView) {
        inspectorContentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: inspectorContentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: inspectorContentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: inspectorContentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200.0)
        inspectorContentView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, widthConstraint])
    }
    
    private func showEmptyInspector(with string: String) {
        let font = NSFont.boldSystemFont(ofSize: 18)
        var attrs : [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]
        attrs[NSAttributedString.Key.foregroundColor] = NSColor.secondaryLabelColor
        let attrString = NSAttributedString(string: string, attributes: attrs)
        let view = NSTextField(labelWithAttributedString: attrString)
        inspectorContentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: inspectorContentView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: inspectorContentView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        inspectorContentView.addConstraints([horizontalConstraint,verticalConstraint])
    }
    
    // MARK: - Notifications
    @objc private func navigationSelectionChanged(sender: Any){
        Swift.print("recieved navigation selection change")
        changeInspectorView()
    }
}
