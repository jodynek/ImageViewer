//
//  ViewController.swift
//  TestSwift
//
//  Created by Petr Jodas on 10.06.15.
//  Copyright © 2015 Petr Jodas. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  @IBOutlet weak var imageView: JImageView!
  @IBOutlet weak var scrollView: NSScrollView!
  var imagesCollection = [String]()  // collection of images in directory
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let fileManager = NSFileManager.defaultManager()
    if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.PicturesDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
      var dir = dirs[0] // pictures directory
      dir = dir + "/testy"
      readDirectoryContent(dir)
      displayImage(0)
    }
  }

  override var representedObject: AnyObject? {
    didSet {
    // Update the view, if already loaded.
    }
  }
    
  func readDirectoryContent(folderPath:String)
  {
    imagesCollection.removeAll(keepCapacity: false)
    let fileManager = NSFileManager.defaultManager()
    let enumerator:NSDirectoryEnumerator? = fileManager.enumeratorAtPath(folderPath)
    while let element = enumerator?.nextObject() as? String
    {
      if element.hasSuffix("jpg") { // checks the extension
        //println(element)
        var wholePath = folderPath.stringByAppendingPathComponent(element)
        imagesCollection.append(wholePath)
      }
    }
  }
  
  func displayImage(iPos:Int)
  {
    if (imagesCollection.count > 0)
    {
      var url = NSURL(fileURLWithPath: imagesCollection[iPos])
      if (NSFileManager().fileExistsAtPath(imagesCollection[iPos]))
      {
        if let image = NSImage(byReferencingFile: url!.path!)
        {
          println("Image loaded")
          self.scrollView.setFrameSize(image.size)
          NSLog("Image size: %dx%d", image.size.width, image.size.height)
          self.imageView.image = image;
          imageView.setNeedsDisplay()
        }
      }
    }
  }
}

