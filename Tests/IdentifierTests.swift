//
// IdentifierTests.swift
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
        let identifier = Identifier(testString)

        XCTAssert(
           (identifier.type == .iPhone) &&
           (identifier.version.major == 8) &&
           (identifier.version.minor == 1),
           "Identifier initilization is failing"
        )
    }
    
    func testIdentifierInitIpad() {
        let testString = "iPad8,1"
        let identifier = Identifier(testString)
        
        XCTAssert(
            (identifier.type == .iPad) &&
                (identifier.version.major == 8) &&
                (identifier.version.minor == 1),
            "Identifier initilization is failing"
        )
    }
    
    func testIdentifierInitSimulatorx86() {
        let testString = "x86_64"
        let identifier = Identifier(testString)
        
        XCTAssert(
            (identifier.type == .simulator) &&
                (identifier.version.major == nil) &&
                (identifier.version.minor == nil),
            "Identifier initilization is failing"
        )
    }
    
    func testIdentifierInitSimulatori386() {
        let testString = "i386"
        let identifier = Identifier(testString)
        
        XCTAssert(
            (identifier.type == .simulator) &&
                (identifier.version.major == nil) &&
                (identifier.version.minor == nil),
            "Identifier initilization is failing"
        )
    }


    // MARK: - iPhone String Description tests
    
    func testDisplayStringiPhone11v8() {
        XCTAssert(Identifier("iPhone11,8").description == "iPhone XR", "iPhone11,8 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone11v6() {
        XCTAssert(Identifier("iPhone11,6").description == "iPhone XS Max (China)", "iPhone11,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone11v4() {
        XCTAssert(Identifier("iPhone11,4").description == "iPhone XS Max", "iPhone11,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone11v2() {
        XCTAssert(Identifier("iPhone11,2").description == "iPhone XS", "iPhone11,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone10v6() {
        XCTAssert(Identifier("iPhone10,6").description == "iPhone X", "iPhone10,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone10v5() {
        XCTAssert(Identifier("iPhone10,5").description == "iPhone 8 Plus", "iPhone10,5 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone10v4() {
        XCTAssert(Identifier("iPhone10,4").description == "iPhone 8", "iPhone10,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone10v3() {
        XCTAssert(Identifier("iPhone10,3").description == "iPhone X", "iPhone10,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone10v2() {
        XCTAssert(Identifier("iPhone10,2").description == "iPhone 8 Plus", "iPhone10,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone10v1() {
        XCTAssert(Identifier("iPhone10,1").description == "iPhone 8", "iPhone10,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone9v4() {
        XCTAssert(Identifier("iPhone9,4").description == "iPhone 7 Plus", "iPhone9,4 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone9v3() {
        XCTAssert(Identifier("iPhone9,3").description == "iPhone 7", "iPhone9,3 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone9v2() {
        XCTAssert(Identifier("iPhone9,2").description == "iPhone 7 Plus", "iPhone9,2 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone9v1() {
        XCTAssert(Identifier("iPhone9,1").description == "iPhone 7", "iPhone9,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone8v4() {
        XCTAssert(Identifier("iPhone8,4").description == "iPhone SE (GSM)", "iPhone8,4 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone8v3() {
        XCTAssert(Identifier("iPhone8,3").description == "iPhone SE (GSM+CDMA)", "iPhone8,3 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone8v2() {
        XCTAssert(Identifier("iPhone8,2").description == "iPhone 6s Plus", "iPhone8,2 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone8v1() {
        XCTAssert(Identifier("iPhone8,1").description == "iPhone 6s", "iPhone8,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone7v2() {
        XCTAssert(Identifier("iPhone7,2").description == "iPhone 6", "iPhone7,2 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone7v1() {
        XCTAssert(Identifier("iPhone7,1").description == "iPhone 6 Plus", "iPhone7,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone6v2() {
        XCTAssert(Identifier("iPhone6,2").description == "iPhone 5S (Global)", "iPhone6,2 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone6v1() {
        XCTAssert(Identifier("iPhone6,1").description == "iPhone 5S (GSM)", "iPhone6,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone5v4() {
        XCTAssert(Identifier("iPhone5,4").description == "iPhone 5C (Global)", "iPhone5,4 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone5v3() {
        XCTAssert(Identifier("iPhone5,3").description == "iPhone 5C (GSM)", "iPhone5,3 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone5v2() {
        XCTAssert(Identifier("iPhone5,2").description == "iPhone 5 CDMA+LTE", "iPhone5,2 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone5v1() {
        XCTAssert(Identifier("iPhone5,1").description == "iPhone 5 GSM+LTE", "iPhone5,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone4v1() {
        XCTAssert(Identifier("iPhone4,1").description == "iPhone 4S", "iPhone4,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone3v3() {
        XCTAssert(Identifier("iPhone3,3").description == "iPhone 4 CDMA", "iPhone3,3 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone3v2() {
        XCTAssert(Identifier("iPhone3,2").description == "iPhone 4 GSM Rev A", "iPhone3,2 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone3v1() {
        XCTAssert(Identifier("iPhone3,1").description == "iPhone 4", "iPhone3,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone2v1() {
        XCTAssert(Identifier("iPhone2,1").description == "iPhone 3GS", "iPhone2,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPhone1v2() {
        XCTAssert(Identifier("iPhone1,2").description == "iPhone 3G", "iPhone1,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone1v1() {
        XCTAssert(Identifier("iPhone1,1").description == "iPhone", "iPhone1,1 is failing to produce a common device model string")
    }


    // MARK: - iPod

    func testDisplayStringiPod7v1() {
        XCTAssert(Identifier("iPod7,1").description == "6th Gen iPod", "iPod7,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPod5v1() {
        XCTAssert(Identifier("iPod5,1").description == "5th Gen iPod", "iPod5,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPod4v1() {
        XCTAssert(Identifier("iPod4,1").description == "4th Gen iPod", "iPod4,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPod3v1() {
        XCTAssert(Identifier("iPod3,1").description == "3rd Gen iPod", "iPod3,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPod2v1() {
        XCTAssert(Identifier("iPod2,1").description == "2nd Gen iPod", "iPod2,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPod1v1() {
        XCTAssert(Identifier("iPod1,1").description == "1st Gen iPod", "iPod1,1 is failing to produce a common device model string")
    }


    // MARK: - iPad
    
    func testDisplayStringiPad7v6() {
        XCTAssert(Identifier("iPad7,6").description == "6th Gen iPad (Cellular)", "iPad6,12 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad7v5() {
        XCTAssert(Identifier("iPad7,5").description == "6th Gen iPad (WiFi)", "iPad6,11 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad7v4() {
        XCTAssert(Identifier("iPad7,4").description == "iPad Pro (10.5 inch, Wi-Fi+LTE)", "iPad7,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad7v3() {
        XCTAssert(Identifier("iPad7,3").description == "iPad Pro (10.5 inch, Wi-Fi)", "iPad7,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad7v2() {
        XCTAssert(Identifier("iPad7,2").description == "2nd Gen iPad Pro (12.9 inch, Wi-Fi+LTE)", "iPad7,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad7v1() {
        XCTAssert(Identifier("iPad7,1").description == "2nd Gen iPad Pro (12.9 inch, Wi-Fi)", "iPad7,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad6v12() {
        XCTAssert(Identifier("iPad6,12").description == "5th Gen iPad (Cellular)", "iPad6,12 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad6v11() {
        XCTAssert(Identifier("iPad6,11").description == "5th Gen iPad (WiFi)", "iPad6,11 is failing to produce a common device model string")
    }

    func testDisplayStringiPad6v8() {
        XCTAssert(Identifier("iPad6,8").description == "iPad Pro (12.9 inch, Wi-Fi+LTE)", "iPad6,8 is failing to produce a common device model string")
    }

    func testDisplayStringiPad6v7() {
        XCTAssert(Identifier("iPad6,7").description == "iPad Pro (12.9 inch, Wi-Fi)", "iPad6,7 is failing to produce a common device model string")
    }

    func testDisplayStringiPad6v4() {
        XCTAssert(Identifier("iPad6,4").description == "iPad Pro (9.7 inch, Wi-Fi+LTE)", "iPad6,4 is failing to produce a common device model string")
    }

    func testDisplayStringiPad6v3() {
        XCTAssert(Identifier("iPad6,3").description == "iPad Pro (9.7 inch, Wi-Fi)", "iPad6,3 is failing to produce a common device model string")
    }

    func testDisplayStringiPad5v4() {
        XCTAssert(Identifier("iPad5,4").description == "iPad Air 2 (Cellular)", "iPad5,4 is failing to produce a common device model string")
    }

    func testDisplayStringiPad5v3() {
        XCTAssert(Identifier("iPad5,3").description == "iPad Air 2 (WiFi)", "iPad5,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad5v2() {
        XCTAssert(Identifier("iPad5,2").description == "iPad mini 4 (WiFi+LTE)", "iPad5,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad5v1() {
        XCTAssert(Identifier("iPad5,1").description == "iPad mini 4 (WiFi)", "iPad5,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPad4v9() {
        XCTAssert(Identifier("iPad4,9").description == "iPad mini 3 (China)", "iPad4,9 is failing to produce a common device model string")
    }

    func testDisplayStringiPad4v8() {
        XCTAssert(Identifier("iPad4,8").description == "iPad mini 3 (GSM+CDMA)", "iPad4,8 is failing to produce a common device model string")
    }

    func testDisplayStringiPad4v7() {
        XCTAssert(Identifier("iPad4,7").description == "iPad mini 3 (WiFi)", "iPad4,7 is failing to produce a common device model string")
    }

    func testDisplayStringiPad4v6() {
        XCTAssert(Identifier("iPad4,6").description == "iPad mini Retina (China)", "iPad4,6 is failing to produce a common device model string")
    }

    func testDisplayStringiPad4v5() {
        XCTAssert(Identifier("iPad4,5").description == "iPad mini Retina (GSM+CDMA)", "iPad4,5 is failing to produce a common device model string")
    }

    func testDisplayStringiPad4v4() {
        XCTAssert(Identifier("iPad4,4").description == "iPad mini Retina (WiFi)", "iPad4,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad4v3() {
        XCTAssert(Identifier("iPad4,3").description == "iPad Air (China)", "iPad4,3 is failing to produce a common device model string")
    }

    func testDisplayStringiPad4v2() {
        XCTAssert(Identifier("iPad4,2").description == "iPad Air (GSM+CDMA)", "iPad4,2 is failing to produce a common device model string")
    }

    func testDisplayStringiPad4v1() {
        XCTAssert(Identifier("iPad4,1").description == "iPad Air (WiFi)", "iPad4,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPad3v6() {
        XCTAssert(Identifier("iPad3,6").description == "4th Gen iPad CDMA+LTE", "iPad3,6 is failing to produce a common device model string")
    }

    func testDisplayStringiPad3v5() {
        XCTAssert(Identifier("iPad3,5").description == "4th Gen iPad GSM+LTE", "iPad3,5 is failing to produce a common device model string")
    }

    func testDisplayStringiPad3v4() {
        XCTAssert(Identifier("iPad3,4").description == "4th Gen iPad", "iPad3,4 is failing to produce a common device model string")
    }

    func testDisplayStringiPad3v3() {
        XCTAssert(Identifier("iPad3,3").description == "3rd Gen iPad GSM", "iPad3,3 is failing to produce a common device model string")
    }

    func testDisplayStringiPad3v2() {
        XCTAssert(Identifier("iPad3,2").description == "3rd Gen iPad CDMA", "iPad3,2 is failing to produce a common device model string")
    }

    func testDisplayStringiPad3v1() {
        XCTAssert(Identifier("iPad3,1").description == "3rd Gen iPad", "iPad3,1 is failing to produce a common device model string")
    }

    func testDisplayStringiPad2v7() {
        XCTAssert(Identifier("iPad2,7").description == "iPad mini CDMA+LTE", "iPad2,7 is failing to produce a common device model string")
    }

    func testDisplayStringiPad2v6() {
        XCTAssert(Identifier("iPad2,6").description == "iPad mini GSM+LTE", "iPad2,6 is failing to produce a common device model string")
    }

    func testDisplayStringiPad2v5() {
        XCTAssert(Identifier("iPad2,5").description == "iPad mini", "iPad2,5 is failing to produce a common device model string")
    }

    func testDisplayStringiPad2v4() {
        XCTAssert(Identifier("iPad2,4").description == "2nd Gen iPad New Revision", "iPad2,4 is failing to produce a common device model string")
    }

    func testDisplayStringiPad2v3() {
        XCTAssert(Identifier("iPad2,3").description == "2nd Gen iPad CDMA", "iPad2,3 is failing to produce a common device model string")
    }

    func testDisplayStringiPad2v2() {
        XCTAssert(Identifier("iPad2,2").description == "2nd Gen iPad GSM", "iPad2,2 is failing to produce a common device model string")
    }

    func testDisplayStringiPad2v1() {
        XCTAssert(Identifier("iPad2,1").description == "2nd Gen iPad", "iPad2,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad1v2() {
        XCTAssert(Identifier("iPad1,2").description == "iPad 3G", "iPad1,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad1v1() {
        XCTAssert(Identifier("iPad1,1").description == "iPad", "iPad1,1 is failing to produce a common device model string")
    }
}
