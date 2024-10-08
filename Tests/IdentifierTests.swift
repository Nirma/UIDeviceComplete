//
// IdentifierTests.swift
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

    #if os(iOS)
    // MARK: - iPhone String Description tests
    
    func testDisplayStringiPhone17v4() {
        XCTAssert(Identifier("iPhone17,4").description == "iPhone 16 Plus", "iPhone17,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone17v3() {
        XCTAssert(Identifier("iPhone17,3").description == "iPhone 16", "iPhone17,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone17v2() {
        XCTAssert(Identifier("iPhone17,2").description == "iPhone 16 Pro Max", "iPhone17,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone17v1() {
        XCTAssert(Identifier("iPhone17,1").description == "iPhone 16 Pro", "iPhone17,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone16v2() {
        XCTAssert(Identifier("iPhone16,2").description == "iPhone 15 Pro Max", "iPhone16,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone16v1() {
        XCTAssert(Identifier("iPhone16,1").description == "iPhone 15 Pro", "iPhone16,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone15v5() {
        XCTAssert(Identifier("iPhone15,5").description == "iPhone 15 Plus", "iPhone15,5 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone15v4() {
        XCTAssert(Identifier("iPhone15,4").description == "iPhone 15", "iPhone15,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone15v3() {
        XCTAssert(Identifier("iPhone15,3").description == "iPhone 14 Pro Max", "iPhone15,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone15v2() {
        XCTAssert(Identifier("iPhone15,2").description == "iPhone 14 Pro", "iPhone15,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone14v8() {
        XCTAssert(Identifier("iPhone14,8").description == "iPhone 14 Plus", "iPhone14,8 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone14v7() {
        XCTAssert(Identifier("iPhone14,7").description == "iPhone 14", "iPhone14,7 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone14v6() {
        XCTAssert(Identifier("iPhone14,6").description == "iPhone SE (3rd Gen)", "iPhone14,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone14v5() {
        XCTAssert(Identifier("iPhone14,5").description == "iPhone 13", "iPhone14,5 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone14v4() {
        XCTAssert(Identifier("iPhone14,4").description == "iPhone 13 mini", "iPhone14,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone14v3() {
        XCTAssert(Identifier("iPhone14,3").description == "iPhone 13 Pro Max", "iPhone14,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone14v2() {
        XCTAssert(Identifier("iPhone14,2").description == "iPhone 13 Pro", "iPhone14,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone13v4() {
        XCTAssert(Identifier("iPhone13,4").description == "iPhone 12 Pro Max", "iPhone13,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone13v3() {
        XCTAssert(Identifier("iPhone13,3").description == "iPhone 12 Pro", "iPhone13,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone13v2() {
        XCTAssert(Identifier("iPhone13,2").description == "iPhone 12", "iPhone13,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone13v1() {
        XCTAssert(Identifier("iPhone13,1").description == "iPhone 12 mini", "iPhone13,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone12v8() {
        XCTAssert(Identifier("iPhone12,8").description == "iPhone SE (2nd Gen)", "iPhone12,8 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone12v5() {
        XCTAssert(Identifier("iPhone12,5").description == "iPhone 11 Pro Max", "iPhone12,5 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone12v3() {
        XCTAssert(Identifier("iPhone12,3").description == "iPhone 11 Pro", "iPhone12,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPhone12v1() {
        XCTAssert(Identifier("iPhone12,1").description == "iPhone 11", "iPhone12,1 is failing to produce a common device model string")
    }
    
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
    
    func testDisplayStringiPod9v1() {
        XCTAssert(Identifier("iPod9,1").description == "7th Gen iPod", "iPod9,1 is failing to produce a common device model string")
    }

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
    
    
    func testDisplayStringiPad16v6() {
        XCTAssert(Identifier("iPad16,6").description == "iPad Pro M4 (13 inch, Wi-Fi+5G)", "iPad16,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad16v5() {
        XCTAssert(Identifier("iPad16,5").description == "iPad Pro M4 (13 inch, Wi-Fi)", "iPad16,5 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad16v4() {
        XCTAssert(Identifier("iPad16,4").description == "iPad Pro M4 (11 inch, Wi-Fi+5G)", "iPad16,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad16v3() {
        XCTAssert(Identifier("iPad16,3").description == "iPad Pro M4 (11 inch, Wi-Fi)", "iPad16,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v11() {
        XCTAssert(Identifier("iPad14,11").description == "iPad Air M2 (13 inch, Wi-Fi+5G)", "iPad14,11 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v10() {
        XCTAssert(Identifier("iPad14,10").description == "iPad Air M2 (13 inch, Wi-Fi)", "iPad14,10 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v9() {
        XCTAssert(Identifier("iPad14,9").description == "iPad Air M2 (11 inch, Wi-Fi+5G)", "iPad14,9 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v8() {
        XCTAssert(Identifier("iPad14,8").description == "iPad Air M2 (11 inch, Wi-Fi)", "iPad14,8 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v6() {
        XCTAssert(Identifier("iPad14,6").description == "6th Gen iPad Pro (12.9 inch, Wi-Fi+5G)", "iPad14,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v5() {
        XCTAssert(Identifier("iPad14,5").description == "6th Gen iPad Pro (12.9 inch, Wi-Fi)", "iPad14,5 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v4() {
        XCTAssert(Identifier("iPad14,4").description == "4th Gen iPad Pro (11 inch, Wi-Fi+5G)", "iPad14,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v3() {
        XCTAssert(Identifier("iPad14,3").description == "4th Gen iPad Pro (11 inch, Wi-Fi)", "iPad14,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v2() {
        XCTAssert(Identifier("iPad14,2").description == "6th Gen iPad mini (8.3 inch, Wi-Fi+5G)", "iPad14,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad14v1() {
        XCTAssert(Identifier("iPad14,1").description == "6th Gen iPad mini (8.3 inch, Wi-Fi)", "iPad14,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad13v16() {
        XCTAssert(Identifier("iPad13,16").description == "5th Gen iPad Air (Wi-Fi)", "iPad13,16 is failing to produce a common device model string")
    }
    func testDisplayStringiPad13v17() {
        XCTAssert(Identifier("iPad13,17").description == "5th Gen iPad Air (Wi-Fi+5G)", "iPad13,17 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad13v11() {
        XCTAssert(Identifier("iPad13,11").description == "5th Gen iPad Pro (12.9 inch, Wi-Fi+5G, 16GB RAM)", "iPad13,11 is failing to produce a common device model string")
    }
    func testDisplayStringiPad13v10() {
        XCTAssert(Identifier("iPad13,10").description == "5th Gen iPad Pro (12.9 inch, Wi-Fi+5G)", "iPad13,10 is failing to produce a common device model string")
    }
    func testDisplayStringiPad13v9() {
        XCTAssert(Identifier("iPad13,9").description == "5th Gen iPad Pro (12.9 inch, Wi-Fi, 16GB RAM)", "iPad13,9 is failing to produce a common device model string")
    }
    func testDisplayStringiPad13v8() {
        XCTAssert(Identifier("iPad13,8").description == "5th Gen iPad Pro (12.9 inch, Wi-Fi)", "iPad13,8 is failing to produce a common device model string")
    }
    func testDisplayStringiPad13v7() {
        XCTAssert(Identifier("iPad13,7").description == "3rd Gen iPad Pro (11 inch, Wi-Fi+5G, 16GB RAM)", "iPad13,7 is failing to produce a common device model string")
    }
    func testDisplayStringiPad13v6() {
        XCTAssert(Identifier("iPad13,6").description == "3rd Gen iPad Pro (11 inch, Wi-Fi+5G)", "iPad13,6 is failing to produce a common device model string")
    }
    func testDisplayStringiPad13v5() {
        XCTAssert(Identifier("iPad13,5").description == "3rd Gen iPad Pro (11 inch, Wi-Fi, 16GB RAM)", "iPad13,5 is failing to produce a common device model string")
    }
    func testDisplayStringiPad13v4() {
        XCTAssert(Identifier("iPad13,4").description == "3rd Gen iPad Pro (11 inch, Wi-Fi)", "iPad13,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad13v2() {
        XCTAssert(Identifier("iPad13,2").description == "4th Gen iPad Air (Wi-Fi+LTE)", "iPad13,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad13v1() {
        XCTAssert(Identifier("iPad13,1").description == "4th Gen iPad Air (Wi-Fi)", "iPad13,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad12v2() {
        XCTAssert(Identifier("iPad12,2").description == "9th Gen iPad (10.2 inch, Wi-Fi+LTE)", "iPad12,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad12v1() {
        XCTAssert(Identifier("iPad12,1").description == "9th Gen iPad (10.2 inch, Wi-Fi)", "iPad12,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad11v7() {
        XCTAssert(Identifier("iPad11,7").description == "8th Gen iPad (10.2 inch, Cellular)", "iPad11,7 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad11v6() {
        XCTAssert(Identifier("iPad11,6").description == "8th Gen iPad (10.2 inch, WiFi)", "iPad11,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad11v4() {
        XCTAssert(Identifier("iPad11,4").description == "3rd Gen iPad Air (Wi-Fi+LTE)", "iPad11,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad11v3() {
        XCTAssert(Identifier("iPad11,3").description == "3rd Gen iPad Air (Wi-Fi)", "iPad11,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad11v2() {
        XCTAssert(Identifier("iPad11,2").description == "5th Gen iPad Mini (Wi-Fi+LTE)", "iPad11,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad11v1() {
        XCTAssert(Identifier("iPad11,1").description == "5th Gen iPad Mini (Wi-Fi)", "iPad11,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v12() {
        XCTAssert(Identifier("iPad8,12").description == "4th Gen iPad Pro (12.9 inch, Wi-Fi+LTE)", "iPad8,12 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v11() {
        XCTAssert(Identifier("iPad8,11").description == "4th Gen iPad Pro (12.9 inch, Wi-Fi)", "iPad8,11 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v10() {
        XCTAssert(Identifier("iPad8,10").description == "2nd Gen iPad Pro (11 inch, Wi-Fi+LTE)", "iPad8,10 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v9() {
        XCTAssert(Identifier("iPad8,9").description == "2nd Gen iPad Pro (11 inch, Wi-Fi)", "iPad8,9 is failing to produce a common device model string")
    }
    
    
    func testDisplayStringiPad8v8() {
        XCTAssert(Identifier("iPad8,8").description == "3rd Gen iPad Pro (12.9 inch, Wi-Fi+LTE, 1TB)", "iPad8,8 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v7() {
        XCTAssert(Identifier("iPad8,7").description == "3rd Gen iPad Pro (12.9 inch, Wi-Fi+LTE)", "iPad8,7 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v6() {
        XCTAssert(Identifier("iPad8,6").description == "3rd Gen iPad Pro (12.9 inch, Wi-Fi, 1TB)", "iPad8,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v5() {
        XCTAssert(Identifier("iPad8,5").description == "3rd Gen iPad Pro (12.9 inch, Wi-Fi)", "iPad8,5 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v4() {
        XCTAssert(Identifier("iPad8,4").description == "iPad Pro (11 inch, Wi-Fi+LTE, 1TB)", "iPad8,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v3() {
        XCTAssert(Identifier("iPad8,3").description == "iPad Pro (11 inch, Wi-Fi+LTE)", "iPad8,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v2() {
        XCTAssert(Identifier("iPad8,2").description == "iPad Pro (11 inch, Wi-Fi, 1TB)", "iPad8,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad8v1() {
        XCTAssert(Identifier("iPad8,1").description == "iPad Pro (11 inch, Wi-Fi)", "iPad8,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad7v12() {
        XCTAssert(Identifier("iPad7,12").description == "7th Gen iPad (10.2 inch, Cellular)", "iPad7,12 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad7v11() {
        XCTAssert(Identifier("iPad7,11").description == "7th Gen iPad (10.2 inch, WiFi)", "iPad7,11 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad7v6() {
        XCTAssert(Identifier("iPad7,6").description == "6th Gen iPad (Cellular)", "iPad7,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringiPad7v5() {
        XCTAssert(Identifier("iPad7,5").description == "6th Gen iPad (WiFi)", "iPad7,5 is failing to produce a common device model string")
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
    #endif
    
    #if os(watchOS)
    func testDisplayStringWatch1v1() {
        XCTAssert(Identifier("Watch1,1").description == "Apple Watch (1st generation), 38mm case", "Watch1,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch1v2() {
        XCTAssert(Identifier("Watch1,2").description == "Apple Watch (1st generation), 42mm case", "Watch1,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch2v3() {
        XCTAssert(Identifier("Watch2,3").description == "Apple Watch Series 2, 38mm case", "Watch2,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch2v4() {
        XCTAssert(Identifier("Watch2,4").description == "Apple Watch Series 2, 42mm case", "Watch2,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch2v6() {
        XCTAssert(Identifier("Watch2,6").description == "Apple Watch Series 1, 38mm case", "Watch2,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch2v7() {
        XCTAssert(Identifier("Watch2,7").description == "Apple Watch Series 1, 42mm case", "Watch2,7 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch3v1() {
        XCTAssert(Identifier("Watch3,1").description == "Apple Watch Series 3, 38mm case (GPS + Cellular)", "Watch3,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch3v2() {
        XCTAssert(Identifier("Watch3,2").description == "Apple Watch Series 3, 42mm case (GPS + Cellular)", "Watch3,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch3v3() {
        XCTAssert(Identifier("Watch3,3").description == "Apple Watch Series 3, 38mm case (GPS)", "Watch3,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch3v4() {
        XCTAssert(Identifier("Watch3,4").description == "Apple Watch Series 3, 42mm case (GPS)", "Watch3,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch4v1() {
        XCTAssert(Identifier("Watch4,1").description == "Apple Watch Series 4, 40mm case (GPS)", "Watch4,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch4v2() {
        XCTAssert(Identifier("Watch4,2").description == "Apple Watch Series 4, 44mm case (GPS)", "Watch4,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch4v3() {
        XCTAssert(Identifier("Watch4,3").description == "Apple Watch Series 4, 40mm case (GPS + Cellular)", "Watch4,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch4v4() {
        XCTAssert(Identifier("Watch4,4").description == "Apple Watch Series 4, 44mm case (GPS + Cellular)", "Watch4,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch5v1() {
        XCTAssert(Identifier("Watch5,1").description == "Apple Watch Series 5, 40mm case (GPS)", "Watch5,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch5v2() {
        XCTAssert(Identifier("Watch5,2").description == "Apple Watch Series 5, 44mm case (GPS)", "Watch5,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch5v3() {
        XCTAssert(Identifier("Watch5,3").description == "Apple Watch Series 5, 40mm case (GPS + Cellular)", "Watch5,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch5v4() {
        XCTAssert(Identifier("Watch5,4").description == "Apple Watch Series 5, 44mm case (GPS + Cellular)", "Watch5,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch5v9() {
        XCTAssert(Identifier("Watch5,9").description == "Apple Watch SE, 40mm case (GPS)", "Watch5,9 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch5v10() {
        XCTAssert(Identifier("Watch5,10").description == "Apple Watch SE, 44mm case (GPS)", "Watch5,10 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch5v11() {
        XCTAssert(Identifier("Watch5,11").description == "Apple Watch SE, 40mm case (GPS + Cellular)", "Watch5,11 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch5v12() {
        XCTAssert(Identifier("Watch5,12").description == "Apple Watch SE, 44mm case (GPS + Cellular)", "Watch5,12 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v1() {
        XCTAssert(Identifier("Watch6,1").description == "Apple Watch Series 6, 40mm case (GPS)", "Watch6,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v2() {
        XCTAssert(Identifier("Watch6,2").description == "Apple Watch Series 6, 44mm case (GPS)", "Watch6,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v3() {
        XCTAssert(Identifier("Watch6,3").description == "Apple Watch Series 6, 40mm case (GPS + Cellular)", "Watch6,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v4() {
        XCTAssert(Identifier("Watch6,4").description == "Apple Watch Series 6, 44mm case (GPS + Cellular)", "Watch6,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v6() {
        XCTAssert(Identifier("Watch6,6").description == "Apple Watch Series 7, 41mm case (GPS)", "Watch6,6 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v7() {
        XCTAssert(Identifier("Watch6,7").description == "Apple Watch Series 7, 45mm case (GPS)", "Watch6,7 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v8() {
        XCTAssert(Identifier("Watch6,8").description == "Apple Watch Series 7, 41mm case (GPS + Cellular)", "Watch6,8 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v9() {
        XCTAssert(Identifier("Watch6,9").description == "Apple Watch Series 7, 45mm case (GPS + Cellular)", "Watch6,9 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v10() {
        XCTAssert(Identifier("Watch6,10").description == "Apple Watch SE (2nd Generation), 40mm case (GPS)", "Watch6,10 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v11() {
        XCTAssert(Identifier("Watch6,11").description == "Apple Watch SE (2nd Generation), 44mm case (GPS)", "Watch6,11 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v12() {
        XCTAssert(Identifier("Watch6,12").description == "Apple Watch SE (2nd Generation), 40mm case (GPS + Cellular)", "Watch6,12 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v13() {
        XCTAssert(Identifier("Watch6,13").description == "Apple Watch SE (2nd Generation), 44mm case (GPS + Cellular)", "Watch6,13 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v14() {
        XCTAssert(Identifier("Watch6,14").description == "Apple Watch Series 8, 41mm case (GPS)", "Watch6,14 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v15() {
        XCTAssert(Identifier("Watch6,15").description == "Apple Watch Series 8, 45mm case (GPS)", "Watch6,15 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v16() {
        XCTAssert(Identifier("Watch6,16").description == "Apple Watch Series 8, 41mm case (GPS + Cellular)", "Watch6,16 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v17() {
        XCTAssert(Identifier("Watch6,17").description == "Apple Watch Series 8, 45mm case (GPS + Cellular)", "Watch6,17 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch6v18() {
        XCTAssert(Identifier("Watch6,18").description == "Apple Watch Ultra", "Watch6,18 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch7v1() {
        XCTAssert(Identifier("Watch7,1").description == "Apple Watch Series 9, 41mm case (GPS)", "Watch7,1 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch7v2() {
        XCTAssert(Identifier("Watch7,2").description == "Apple Watch Series 9, 45mm case (GPS)", "Watch7,2 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch7v3() {
        XCTAssert(Identifier("Watch7,3").description == "Apple Watch Series 9, 41mm case (GPS + Cellular)", "Watch7,3 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch7v4() {
        XCTAssert(Identifier("Watch7,4").description == "Apple Watch Series 9, 45mm case (GPS + Cellular)", "Watch7,4 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch7v5() {
        XCTAssert(Identifier("Watch7,5").description == "Apple Watch Ultra 2", "Watch7,5 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch7v8() {
        XCTAssert(Identifier("Watch7,8").description == "Apple Watch Series 10, 42mm case (GPS)", "Watch7,8 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch7v9() {
        XCTAssert(Identifier("Watch7,9").description == "Apple Watch Series 10, 46mm case (GPS)", "Watch7,9 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch7v10() {
        XCTAssert(Identifier("Watch7,10").description == "Apple Watch Series 10, 42mm case (GPS + Cellular)", "Watch7,10 is failing to produce a common device model string")
    }
    
    func testDisplayStringWatch7v11() {
        XCTAssert(Identifier("Watch7,11").description == "Apple Watch Series 10, 46mm case (GPS + Cellular)", "Watch7,11 is failing to produce a common device model string")
    }
    
    #endif
}
