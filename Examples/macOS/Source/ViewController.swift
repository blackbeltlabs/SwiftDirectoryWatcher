//
//  ViewController.swift
//  DirectoryWatcher-Mac-Showcase
//
//  Created by Mirko on 1/24/19.
//  Copyright © 2019 Blackbelt Labs. All rights reserved.
//

import Cocoa
import SwiftDirectoryWatcher

class ViewController: NSViewController {
  lazy var url = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
  lazy var watcher = DirectoryWatcher(url: url)
  
  @IBOutlet var textView: NSTextView!
  
  var urls: [URL] = []
  var string: String {
    let urlStrings = urls.map { $0.path }
    return urlStrings.joined(separator: "\n")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    watcher.delegate = self
    watcher.start()
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
}

extension ViewController: DirectoryWatcherDelegate {
  func directoryWatcher(_ watcher: DirectoryWatcher, changed: DirectoryChangeSet) {
    if changed.newFiles.count > 0 {
      urls = urls + changed.newFiles
      textView.string = string
    }
  }
}
