//
//  XCTestCase+MemoryLeakTracking.swift
//  TopStoriesFeedTests
//
//  Created by Aymen Aifa on 13.08.22.
//

import XCTest

extension XCTestCase {
     func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
