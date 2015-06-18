//
//  JImageView.swift
//  TestSwift
//
//  Created by Petr Jodas on 17.06.15.
//  Copyright (c) 2015 Petr Jodas. All rights reserved.
//

import Foundation
import AppKit;

class JImageView: NSImageView {
  var img=NSImage()
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    
    img=NSImage(size: self.bounds.size)
    self.image=img
    println(self.image) // "nil"
  }
  
  override func drawRect(dirtyRect: NSRect)
  {
    NSColor.blackColor().setFill();
    NSRectFill(dirtyRect);
    super.drawRect(dirtyRect);
  }
}