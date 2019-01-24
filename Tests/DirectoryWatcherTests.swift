//
//  DirectoryWatcherTests.swift
//  DirectoryWatcherTests
//
//  Created by Mirko on 1/24/19.
//  Copyright © 2019 Blackbelt Labs. All rights reserved.
//

import XCTest
@testable import DirectoryWatcher

class DirectoryWatcherTests: XCTestCase {
  var watcher: DirectoryWatcher!
  
    override func setUp() {
      let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
      watcher = DirectoryWatcher(url: url)
    }

    override func tearDown() {
      
    }

    func testDirectoryWatcher() {
      watcher.start()
      watcher.stop()
      XCTAssert(true)
    }
}
