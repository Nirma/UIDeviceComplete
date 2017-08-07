//
// IdentifierTests.swift
//
// Copyright (c) 2017 Nicholas Maccharoli
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

@testable import UIDeviceComplete
import XCTest

class IdentifierTests: XCTestCase {

    func testIdentifierTypeVersionComponents() {
        let testString = "iPhone0,0"
        let result: (String, Int?, Int?) = Identifier.typeVersionComponents(with: testString)
        let expected: (String, Int?, Int?) = ("iPhone", 0, 0)

        XCTAssert(
            (result.0 == expected.0) &&
            (result.1 == expected.1) &&
            (result.2 == expected.2),
            "Identifier string parsing is failing"
        )
    }

    func testIdentifierInitIphone() {
        let testString = "iPhone8,1"
        let identifier = Identifier(identifier: testString)

        XCTAssert(
           (identifier.type == .iPhone) &&
           (identifier.version.major == 8) &&
           (identifier.version.minor == 1),
           "Identifier initilization is failing"
        )
    }
    
    func testIdentifierInitIpad() {
        let testString = "iPad8,1"
        let identifier = Identifier(identifier: testString)
        
        XCTAssert(
            (identifier.type == .iPad) &&
                (identifier.version.major == 8) &&
                (identifier.version.minor == 1),
            "Identifier initilization is failing"
        )
    }
    
    func testIdentifierInitSimulatorx86() {
        let testString = "x86_64"
        let identifier = Identifier(identifier: testString)
        
        XCTAssert(
            (identifier.type == .simulator) &&
                (identifier.version.major == nil) &&
                (identifier.version.minor == nil),
            "Identifier initilization is failing"
        )
    }
    
    func testIdentifierInitSimulatori386() {
        let testString = "i386"
        let identifier = Identifier(identifier: testString)
        
        XCTAssert(
            (identifier.type == .simulator) &&
                (identifier.version.major == nil) &&
                (identifier.version.minor == nil),
            "Identifier initilization is failing"
        )
    }
}
