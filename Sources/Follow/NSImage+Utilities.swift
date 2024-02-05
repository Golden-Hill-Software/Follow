//
//  NSImage+Utilities.swift
//
//
//  Created by John Brayton on 2/2/24.
//

#if canImport(AppKit)
import AppKit

extension NSImage {
    
    /*
        Mostly copied from Suraj Rao's answer at:
        https://stackoverflow.com/questions/11949250/how-to-resize-nsimage
     */
    func FOL_resized(to: NSSize) -> NSImage {
        let img = NSImage(size: to)

        img.lockFocus()
        defer {
            img.unlockFocus()
        }

        if let ctx = NSGraphicsContext.current {
            ctx.imageInterpolation = .high
            draw(in: NSRect(origin: .zero, size: to),
                 from: NSRect(origin: .zero, size: size),
                 operation: .copy,
                 fraction: 1)
        }

        return img
    }

}
#endif
