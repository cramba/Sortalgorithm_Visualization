//
//  Sortgraph.swift
//  SortalgorithmAbi
//
//  Created by Marc Bachmann on 02.07.18.
//  Copyright © 2018 Marc Bachmann. All rights reserved.
//

import Cocoa

class Sortgraph: NSView {

    private var oldValues: [Int] = []
    var values: [Int] = [] {
        didSet(oldValue) {
            self.oldValues = oldValue
            self.needsDisplay = true
        }
    }
    
    let leftOffset = 20
    let bottomOffset = 20
    let lineSpace = 4
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        NSColor.white.setFill()
        dirtyRect.fill()
        
        drawArray()
        
    }
    
    func drawTheLine(_ value: Int, xPos: Int, color: NSColor) {
        let path = NSBezierPath()
        color.set()
        let startPoint = CGPoint(x: xPos, y: bottomOffset)
        let endPoint = CGPoint(x: xPos, y: bottomOffset + value)
        path.move(to: startPoint)
        path.line(to: endPoint)
        path.lineWidth = 3.0
        path.stroke()
    }

    
    private func drawArray() {
        var lineColor: NSColor = NSColor.blue
        if ((oldValues.count > 0) && (values.count == oldValues.count)) {
            for i in 0..<values.count {
                if (values[i] != self.oldValues[i]) {
                    lineColor = NSColor.red
                } else {
                    lineColor = NSColor.blue
                }
                drawTheLine(values[i], xPos: leftOffset + i * lineSpace, color: lineColor)
            }
        } else {
            for i in 0..<values.count {
                drawTheLine(values[i], xPos: leftOffset + i * lineSpace, color: lineColor)
            }
        }
    }
    
}
