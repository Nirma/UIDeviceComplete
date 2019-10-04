//
//  DeviceModelTests.swift
//  UIDeviceCompleteTests
//
//  Created by Vincent on 26/9/18.
//  Copyright © 2018-2019 Nicholas Maccharoli
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

class DeviceModelTests: XCTestCase {
    
    // MARK: - iPhone Device Model tests
    
    func testDeviceModelIPhone4() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone3,1"))
        XCTAssert(deviceModel == .iPhone4 , "DeviceModel - .iPhone4 is failing")
    }
    
    func testDeviceModelIPhone4S() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone4,1"))
        XCTAssert(deviceModel == .iPhone4S , "DeviceModel - .iPhone4S is failing")
    }
    
    func testDeviceModelIPhone5() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPhone5,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPhone5,2"))
        XCTAssert(deviceModel1 == .iPhone5 , "DeviceModel - .iPhone5 is failing")
        XCTAssert(deviceModel2 == .iPhone5 , "DeviceModel - .iPhone5 is failing")
    }
    
    func testDeviceModelIPhone5C() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPhone5,3"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPhone5,4"))
        XCTAssert(deviceModel1 == .iPhone5C , "DeviceModel - .iPhone5C is failing")
        XCTAssert(deviceModel2 == .iPhone5C , "DeviceModel - .iPhone5C is failing")
    }
    
    func testDeviceModelIPhone5S() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone6,1"))
        XCTAssert(deviceModel == .iPhone5S , "DeviceModel - .iPhone5S is failing")
    }
    
    func testDeviceModelIPhone6() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone7,2"))
        XCTAssert(deviceModel == .iPhone6 , "DeviceModel - .iPhone6 is failing")
    }
    
    func testDeviceModelIPhone6Plus() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone7,1"))
        XCTAssert(deviceModel == .iPhone6Plus , "DeviceModel - .iPhone6Plus is failing")
    }
    
    func testDeviceModelIPhone6S() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone8,1"))
        XCTAssert(deviceModel == .iPhone6S , "DeviceModel - .iPhone6S is failing")
    }
    
    func testDeviceModelIPhone6SPlus() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone8,2"))
        XCTAssert(deviceModel == .iPhone6SPlus , "DeviceModel - .iPhone6SPlus is failing")
    }
    
    func testDeviceModelIPhoneSE() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone8,4"))
        XCTAssert(deviceModel == .iPhoneSE , "DeviceModel - .iPhoneSE is failing")
    }
    
    func testDeviceModelIPhone7() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPhone9,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPhone9,3"))
        XCTAssert(deviceModel1 == .iPhone7 , "DeviceModel - .iPhone7 is failing")
        XCTAssert(deviceModel2 == .iPhone7 , "DeviceModel - .iPhone7 is failing")
    }
    
    func testDeviceModelIPhone7Plus() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPhone9,2"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPhone9,4"))
        XCTAssert(deviceModel1 == .iPhone7Plus , "DeviceModel - .iPhone7Plus is failing")
        XCTAssert(deviceModel2 == .iPhone7Plus , "DeviceModel - .iPhone7Plus is failing")
    }
    
    func testDeviceModelIPhone8() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPhone10,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPhone10,4"))
        XCTAssert(deviceModel1 == .iPhone8 , "DeviceModel - .iPhone8 is failing")
        XCTAssert(deviceModel2 == .iPhone8 , "DeviceModel - .iPhone8 is failing")
    }
    
    func testDeviceModelIPhone8Plus() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPhone10,2"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPhone10,5"))
        XCTAssert(deviceModel1 == .iPhone8Plus , "DeviceModel - .iPhone8Plus is failing")
        XCTAssert(deviceModel2 == .iPhone8Plus , "DeviceModel - .iPhone8Plus is failing")
    }
    
    func testDeviceModelIPhoneX() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPhone10,3"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPhone10,6"))
        XCTAssert(deviceModel1 == .iPhoneX , "DeviceModel - .iPhoneX is failing")
        XCTAssert(deviceModel2 == .iPhoneX , "DeviceModel - .iPhoneX is failing")
    }
    
    func testDeviceModelIPhoneXS() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone11,2"))
        XCTAssert(deviceModel == .iPhoneXS , "DeviceModel - .iPhoneXS is failing")
    }
    
    func testDeviceModelIPhoneXSMax() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPhone11,4"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPhone11,6"))
        XCTAssert(deviceModel1 == .iPhoneXSMax , "DeviceModel - .iPhoneXSMax is failing")
        XCTAssert(deviceModel2 == .iPhoneXSMax , "DeviceModel - .iPhoneXSMax is failing")
    }
    
    func testDeviceModelIPhoneXR() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone11,8"))
        XCTAssert(deviceModel == .iPhoneXR , "DeviceModel - .iPhoneXR is failing")
    }
    
    func testDeviceModelIPhone11Pro() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone12,3"))
        XCTAssert(deviceModel == .iPhone11Pro , "DeviceModel - .iPhone11Pro is failing")
    }
    
    func testDeviceModelIPhone11ProMax() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone12,5"))
        XCTAssert(deviceModel == .iPhone11ProMax , "DeviceModel - .iPhone11ProMax is failing")
    }
    
    func testDeviceModelIPhone11() {
        let deviceModel = DeviceModel(identifier: Identifier("iPhone12,1"))
        XCTAssert(deviceModel == .iPhone11 , "DeviceModel - .iPhone11 is failing")
    }
    
    // MARK: - iPad Device Model tests
    
    func testDeviceModelIPadFirstGen() {
        let deviceModel = DeviceModel(identifier: Identifier("iPad1,1"))
        XCTAssert(deviceModel == .iPadFirstGen , "DeviceModel - .iPadFirstGen is failing")
    }
    
    func testDeviceModelIPadSecondGen() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad2,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad2,2"))
        let deviceModel3 = DeviceModel(identifier: Identifier("iPad2,3"))
        let deviceModel4 = DeviceModel(identifier: Identifier("iPad2,4"))
        XCTAssert(deviceModel1 == .iPadSecondGen && deviceModel2 == .iPadSecondGen && deviceModel3 == .iPadSecondGen && deviceModel4 == .iPadSecondGen , "DeviceModel - .iPadSecondGen is failing")
    }
    
    func testDeviceModelIPadThirdGen() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad3,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad3,2"))
        let deviceModel3 = DeviceModel(identifier: Identifier("iPad3,3"))
        XCTAssert(deviceModel1 == .iPadThirdGen && deviceModel2 == .iPadThirdGen && deviceModel3 == .iPadThirdGen , "DeviceModel - .iPadThirdGen is failing")
    }
    
    func testDeviceModelIPadFourthGen() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad3,4"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad3,5"))
        let deviceModel3 = DeviceModel(identifier: Identifier("iPad3,6"))
        XCTAssert(deviceModel1 == .iPadFourthGen && deviceModel2 == .iPadFourthGen && deviceModel3 == .iPadFourthGen , "DeviceModel - .iPadFourthGen is failing")
    }
    
    func testDeviceModelIPadFifthGen() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad6,11"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad6,12"))
        XCTAssert(deviceModel1 == .iPadFifthGen && deviceModel2 == .iPadFifthGen , "DeviceModel - .iPadFifthGen is failing")
    }
    
    func testDeviceModelIPadSixthGen() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad7,5"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad7,6"))
        XCTAssert(deviceModel1 == .iPadSixthGen && deviceModel2 == .iPadSixthGen , "DeviceModel - .iPadSixthGen is failing")
    }
    
    func testDeviceModelIPadSevenGen() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad7,11"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad7,12"))
        XCTAssert(deviceModel1 == .iPadSevenGen && deviceModel2 == .iPadSevenGen , "DeviceModel - .iPadSevenGen is failing")
    }
    
    func testDeviceModelIPadAir() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad4,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad4,2"))
        let deviceModel3 = DeviceModel(identifier: Identifier("iPad4,3"))
        XCTAssert(deviceModel1 == .iPadAir && deviceModel2 == .iPadAir && deviceModel3 == .iPadAir , "DeviceModel - .iPadAir is failing")
    }
    
    func testDeviceModelIPadAir2() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad5,3"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad5,4"))
        XCTAssert(deviceModel1 == .iPadAir2 && deviceModel2 == .iPadAir2 , "DeviceModel - .iPadAir2 is failing")
    }
    
    func testDeviceModelIPadMini() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad2,5"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad2,6"))
        let deviceModel3 = DeviceModel(identifier: Identifier("iPad2,7"))
        XCTAssert(deviceModel1 == .iPadMini && deviceModel2 == .iPadMini && deviceModel3 == .iPadMini , "DeviceModel - .iPadMini is failing")
    }
    
    func testDeviceModelIPadMini2() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad4,4"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad4,5"))
        let deviceModel3 = DeviceModel(identifier: Identifier("iPad4,6"))
        XCTAssert(deviceModel1 == .iPadMini2 && deviceModel2 == .iPadMini2 && deviceModel3 == .iPadMini2 , "DeviceModel - .iPadMini2 is failing")
    }
    
    func testDeviceModelIPadMini3() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad4,7"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad4,8"))
        let deviceModel3 = DeviceModel(identifier: Identifier("iPad4,9"))
        XCTAssert(deviceModel1 == .iPadMini3 && deviceModel2 == .iPadMini3 && deviceModel3 == .iPadMini3 , "DeviceModel - .iPadMini3 is failing")
    }
    
    func testDeviceModelIPadMini4() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad5,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad5,2"))
        XCTAssert(deviceModel1 == .iPadMini4 && deviceModel2 == .iPadMini4 , "DeviceModel - .iPadMini4 is failing")
    }
    
    func testDeviceModelIPadPro9_7Inch() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad6,3"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad6,4"))
        XCTAssert(deviceModel1 == .iPadPro9_7Inch && deviceModel2 == .iPadPro9_7Inch , "DeviceModel - .iPadPro9_7Inch is failing")
    }
    
    func testDeviceModelIPadPro10_5Inch() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad7,3"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad7,4"))
        XCTAssert(deviceModel1 == .iPadPro10_5Inch && deviceModel2 == .iPadPro10_5Inch , "DeviceModel - .iPadPro10_5Inch is failing")
    }
    func testDeviceModelIPadPro11Inch() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad8,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad8,2"))
        let deviceModel3 = DeviceModel(identifier: Identifier("iPad8,3"))
        let deviceModel4 = DeviceModel(identifier: Identifier("iPad8,4"))
        XCTAssert(deviceModel1 == .iPadPro11Inch && deviceModel2 == .iPadPro11Inch && deviceModel3 == .iPadPro11Inch && deviceModel4 == .iPadPro11Inch, "DeviceModel - .iPadPro11Inch is failing")
    }
    
    func testDeviceModelIPadPro12_9Inch() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad6,7"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad6,8"))
        XCTAssert(deviceModel1 == .iPadPro12_9Inch && deviceModel2 == .iPadPro12_9Inch , "DeviceModel - .iPadPro12_9Inch is failing")
    }
    
    func testDeviceModelIPadPro12_9Inch_SecondGen() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad7,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad7,2"))
        XCTAssert(deviceModel1 == .iPadPro12_9Inch_SecondGen && deviceModel2 == .iPadPro12_9Inch_SecondGen , "DeviceModel - .iPadPro12_9Inch_SecondGen is failing")
    }
    
    func testDeviceModelIPadPro12_9Inch_ThirdGen() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad8,5"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad8,6"))
        let deviceModel3 = DeviceModel(identifier: Identifier("iPad8,7"))
        let deviceModel4 = DeviceModel(identifier: Identifier("iPad8,8"))
        XCTAssert(deviceModel1 == .iPadPro12_9Inch_ThirdGen && deviceModel2 == .iPadPro12_9Inch_ThirdGen && deviceModel3 == .iPadPro12_9Inch_ThirdGen && deviceModel4 == .iPadPro12_9Inch_ThirdGen, "DeviceModel - .iPadPro12_9Inch_ThirdGen is failing")
    }
    
    func testDeviceModelIPadMini5() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad11,1"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad11,2"))
        XCTAssert(deviceModel1 == .iPadMini5 && deviceModel2 == .iPadMini5 , "DeviceModel - .iPadMini5 is failing")
    }
    
    func testDeviceModelIPadAir3() {
        let deviceModel1 = DeviceModel(identifier: Identifier("iPad11,3"))
        let deviceModel2 = DeviceModel(identifier: Identifier("iPad11,4"))
        XCTAssert(deviceModel1 == .iPadAir3 && deviceModel2 == .iPadAir3 , "DeviceModel - .iPadAir3 is failing")
    }
    
    // MARK: - iPod Device Model tests
    
    func testDeviceModelIPodTouchFirstGen() {
        let deviceModel = DeviceModel(identifier: Identifier("iPod1,1"))
        XCTAssert(deviceModel == .iPodTouchFirstGen , "DeviceModel - .iPodFirstGen is failing")
    }
    
    func testDeviceModelIPodTouchSecondGen() {
        let deviceModel = DeviceModel(identifier: Identifier("iPod2,1"))
        XCTAssert(deviceModel == .iPodTouchSecondGen , "DeviceModel - .iPodSecondGen is failing")
    }
    
    func testDeviceModelIPodTouchThirdGen() {
        let deviceModel = DeviceModel(identifier: Identifier("iPod3,1"))
        XCTAssert(deviceModel == .iPodTouchThirdGen , "DeviceModel - .iPodThirdGen is failing")
    }
    
    func testDeviceModelIPodTouchFourthGen() {
        let deviceModel = DeviceModel(identifier: Identifier("iPod4,1"))
        XCTAssert(deviceModel == .iPodTouchFourthGen , "DeviceModel - .iPodFourthGen is failing")
    }
    
    func testDeviceModelIPodTouchFifthGen() {
        let deviceModel = DeviceModel(identifier: Identifier("iPod5,1"))
        XCTAssert(deviceModel == .iPodTouchFifthGen , "DeviceModel - .iPodFifthGen is failing")
    }
    
    func testDeviceModelIPodTouchSixthGen() {
        let deviceModel = DeviceModel(identifier: Identifier("iPod7,1"))
        XCTAssert(deviceModel == .iPodTouchSixthGen , "DeviceModel - .iPodSixthGen is failing")
    }
    func testDeviceModelIPodTouchSeventhGen() {
        let deviceModel = DeviceModel(identifier: Identifier("iPod9,1"))
        XCTAssert(deviceModel == .iPodTouchSeventhGen , "DeviceModel - .iPodSeventhGen is failing")
    }
    
    // MARK: Notch test
    func testHasNotch() {
      let notchModels: [DeviceModel] = [.iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax]

      let noNotchModels: [DeviceModel] = DeviceModel.allCases.filter( { !notchModels.contains($0) })

      notchModels.forEach { XCTAssertTrue($0.hasNotch) }
      noNotchModels.forEach { XCTAssertFalse($0.hasNotch) }
    }
}
