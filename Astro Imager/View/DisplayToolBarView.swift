//
//  DisplayToolBarView.swift
//  Astro Imager
//
//  Created by Don Willems on 01/03/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Cocoa

class DisplayToolBarView: NSView {
    
    public var progress = 0.5 {
        didSet(oldValue) {
            self.setNeedsDisplay(self.frame)
        }
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let linecolor = NSColor.tertiaryLabelColor
        linecolor.set()
        let bp = NSBezierPath(rect: self.frame)
        bp.stroke()
        if progress > 0.0 {
            let progesscolor = NSColor.selectedContentBackgroundColor
            progesscolor.set()
            let width = self.frame.size.width * CGFloat(progress)
            let progressBar = NSBezierPath(rect: NSRect(origin: self.frame.origin, size: NSSize(width: width, height: 3.0)))
            progressBar.fill()
        }
    }
    
}
