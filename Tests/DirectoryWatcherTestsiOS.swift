//
//  DirectoryWatcherTests.swift
//  DirectoryWatcherTests
//
//  Created by Mirko on 1/24/19.
//  Copyright © 2019 Blackbelt Labs. All rights reserved.
//

import XCTest

@testable import DirectoryWatcher

class DirectoryWatcherTestsiOS: XCTestCase {
  var watcher: DirectoryWatcher!
  lazy var directoryURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
  
  override func setUp() {
    watcher = DirectoryWatcher(url: directoryURL)
  }
  
  override func tearDown() {
    
  }
  
  func testDirectoryWatcher() {
    watcher.delegate = self
    watcher.start()
    watcher.stop()
    
    XCTAssert(true)
  }
}

extension DirectoryWatcherTestsiOS: DirectoryWatcherDelegate {
  func directoryWatcher(_ watcher: DirectoryWatcher, changed: DirectoryChangeSet) {
    
  }
}
