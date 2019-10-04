//
// DeviceFamilyTests.swift
//
// Copyright (c) 2017-2019 Nicholas Maccharoli
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

class DeviceFamilyTests: XCTestCase {

    func testDeviceFamilyIPhone() {
        let deviceFamily = DeviceFamily(rawValue: "iPhone")
        XCTAssert(deviceFamily == .iPhone, "DeviceFamily - .iPhone is failing")
    }

    func testDeviceFamilyIPod() {
        let deviceFamily = DeviceFamily(rawValue: "iPod")
        XCTAssert(deviceFamily == .iPod, "DeviceFamily - .iPod is failing")
    }

    func testDeviceFamilyIPad() {
        let deviceFamily = DeviceFamily(rawValue: "iPad")
        XCTAssert(deviceFamily == .iPad, "DeviceFamily - .iPad is failing")
    }
    
    func testInvalidDeviceFamily() {
        let deviceFamily = DeviceFamily(rawValue: "Apple II")
        XCTAssert(deviceFamily == .unknown, "DeviceFamily - .unknown is failing")
    }
    
    func testDeviceIsSimulator() {
        let deviceFamily = DeviceFamily(rawValue: "iPhone")
        #if arch(i386) || arch(x86_64)
        XCTAssert(deviceFamily.isSimulator, "DeviceFamily - .isSimulator is failing")
        #else
        XCTAssert(!(deviceFamily.isSimulator), "DeviceFamily - .isSimulator is failing")
        #endif
    }

}
