//
// UIDeviceExtensionsTests .swift
//
// Copyright (c) 2017-2018 Nicholas Maccharoli
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

class UIDeviceExtensionsTests: XCTestCase {
    
    let DeviceExtensions = UIDeviceComplete(UIDevice())
    
    func testDeviceExtensionsDeviceFamily() {
        XCTAssertNotEqual(.unknown, DeviceExtensions.deviceFamily, "DeviceExtensions - .deviceFamily is failing")
    }
    
    func testDeviceExtensionsDeviceModel() {
        XCTAssertNotEqual(.unknown, DeviceExtensions.deviceModel, "DeviceExtensions - .deviceModel is failing")
    }
    
    func testDeviceExtensionsIsIphone() {
        let deviceFamily = DeviceFamily(rawValue: "iPhone")
        XCTAssert(deviceFamily == .iPhone, "DeviceExtensions - .isIphone is failing")
    }
    
    func testDeviceExtensionsIsIpad() {
        let deviceFamily = DeviceFamily(rawValue: "iPad")
        XCTAssert(deviceFamily == .iPad, "DeviceExtensions - .isIpad is failing")
    }
    
    func testDeviceExtensionsIsIpod() {
        let deviceFamily = DeviceFamily(rawValue: "iPod")
        XCTAssert(deviceFamily == .iPod, "DeviceExtensions - .isIpod is failing")
    }
    
    func testDeviceExtensionsIsSimulator() {
        let deviceFamily = DeviceFamily(rawValue: "x86_64")
        XCTAssert(deviceFamily == .simulator, "DeviceExtensions - .isSimulator is failing")
    }
    
}
