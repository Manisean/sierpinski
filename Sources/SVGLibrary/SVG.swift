//
//  SVG.swift
//  SierpinskiSwift
//
//  A class that can be used to generate
//  a basic SVG file.

import Foundation

open class SVG {
    var total = ""
    // Initialize the SVG file with commands that will create a
    // width x height canvas
    public init(width: UInt, height: UInt) {
      contents_add(line: "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
      contents_add(line: "<svg version=\"1.1\" baseProfile=\"full\" width=\"\(width)\" height=\"\(height)\" xmlns=\"http://www.w3.org/2000/svg\">\n")
    }

    public func contents_add(line: String) -> Void{
      total += line
    }

    public func draw_line(x1: Int, y1: Int, x2: Int, y2: Int, color: String) -> Void {
      contents_add(line: "<line x1=\"\(x1)\" y1=\"\(y1)\" x2=\"\(x2)\" y2=\"\(y2)\" stroke=\"\(color)\" />\n")
    }
    
    // Write the SVG file to disk
    public func write(filePath: String) {
        contents_add(line: "</svg>\n")
        do {
            try total.write(toFile: "\(filePath)", atomically: false, encoding: String.Encoding.utf8) 
        } catch {}
    }
}
