//
//  DirectoryWatcherTests.swift
//  DirectoryWatcherTests
//
//  Created by Mirko on 1/24/19.
//  Copyright © 2019 Blackbelt Labs. All rights reserved.
//

import XCTest
import Cocoa

@testable import DirectoryWatcher

class DirectoryWatcherTests: XCTestCase {
  var watcher: DirectoryWatcher!
  var changeExpectation: XCTestExpectation!
  lazy var directoryURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
  lazy var fileURL = directoryURL.appendingPathComponent("test.txt")
  
  override func setUp() {
    watcher = DirectoryWatcher(url: directoryURL)
    try? FileManager.default.removeItem(at: fileURL)
  }
  
  override func tearDown() {
    
  }
  
  func testDirectoryWatcher() {
    watcher.start()
    
    watcher.delegate = self
    
    changeExpectation = XCTestExpectation(description: "Wait for changes.")
    
    let task = Process()
    task.launchPath = "/usr/bin/touch"
    task.arguments = [fileURL.path]
    task.launch()
    
    wait(for: [changeExpectation], timeout: 10)
  }
}

extension DirectoryWatcherTests: DirectoryWatcherDelegate {
  func directoryWatcher(_ watcher: DirectoryWatcher, changed: DirectoryChangeSet) {
    guard let newFile = changed.newFiles.first else {
      return
    }
    
    if newFile == fileURL {
      changeExpectation.fulfill()
    }
  }
}
