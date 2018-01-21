//
// DeviceModel.swift
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

public enum DeviceModel {

    case iPhone4, iPhone4S
    case iPhone5, iPhone5C, iPhone5S
    case iPhone6, iPhone6Plus, iPhone6S, iPhone6SPlus
    case iPhoneSE
    case iPhone7, iPhone7Plus
    case iPhone8, iPhone8Plus
    case iPhoneX

    case iPadFirstGen, iPadSecondGen, iPadThirdGen, iPadFourthGen, iPadFifthGen

    case iPadAir, iPadAir2

    case iPadMini, iPadMini2, iPadMini3, iPadMini4

    case iPadPro9_7Inch, iPadPro10_5Inch, iPadPro12_9Inch

    case iPodTouchFirstGen, iPodTouchSecondGen, iPodTouchThirdGen,
         iPodTouchFourthGen, iPodTouchFifthGen, iPodTouchSixthGen

    case unknown
}


// MARK: - init

extension DeviceModel {
    init(identifier: Identifier) {
        switch identifier.type {
        case .iPhone:
            self = DeviceModel.detectIphoneModel(with: identifier)
        case .iPad:
            self = DeviceModel.detectIpadModel(with: identifier)
        case .iPod:
            self = DeviceModel.detectIpodModel(with: identifier)
        case .simulator:
            self = DeviceModel.detectSimulatorModel()
        default:
            self = .unknown
        }
    }
}


// MARK: Detecting iPhone Models

extension DeviceModel {
    fileprivate static func detectIphoneModel(with identifier: Identifier) -> DeviceModel {
        guard let major = identifier.version.major,
              let minor = identifier.version.minor,
              identifier.type == .iPhone
              else { return .unknown }

        switch (major, minor) {
        case (3, _):            return .iPhone4
        case (4, _):            return .iPhone4S
        case (5, 1), (5, 2):    return .iPhone5
        case (5, 3), (5, 4):    return .iPhone5C
        case (6, _):            return .iPhone5S
        case (7, 2):            return .iPhone6
        case (7, 1):            return .iPhone6Plus
        case (8, 1):            return .iPhone6S
        case (8, 2):            return .iPhone6SPlus
        case (8, 4):            return .iPhoneSE
        case (9, 1), (9, 3):    return .iPhone7
        case (9, 2), (9, 4):    return .iPhone7Plus
        case (10, 1), (10, 4):  return .iPhone8
        case (10, 2), (10, 5):  return .iPhone8Plus
        case (10, 3), (10, 6):  return .iPhoneX
        default:                return .unknown
        }
    }
}


// MARK: Detecting iPad Models

extension DeviceModel {
    fileprivate static func detectIpadModel(with identifier: Identifier) -> DeviceModel {
        guard let major = identifier.version.major,
            let minor = identifier.version.minor,
            identifier.type == .iPad
            else { return .unknown }

        switch (major, minor) {
        case (1, _):                          return .iPadFirstGen
        case (2, 1), (2, 2), (2, 3), (2, 4):  return .iPadSecondGen
        case (3, 1), (3, 2), (3, 3):          return .iPadThirdGen
        case (3, 4), (3, 5), (3, 6):          return .iPadFourthGen
        case (6, 11), (6, 12):                return .iPadFifthGen
        case (4, 1), (4, 2), (4, 3):          return .iPadAir
        case (5, 3), (5, 4):                  return .iPadAir2
        case (2, 5), (2, 6), (2, 7):          return .iPadMini
        case (4, 4), (4, 5), (4, 6):          return .iPadMini2
        case (4, 7), (4, 8), (4, 9):          return .iPadMini3
        case (6, 3), (6, 4):                  return .iPadPro9_7Inch
        case (7, 3), (7, 4):                  return .iPadPro10_5Inch
        case (6, 7), (6, 8), (7, 1), (7, 2):  return .iPadPro12_9Inch
        default:                              return .unknown
        }
    }
}


// MARK: Detecting iPod Models

extension DeviceModel {
    fileprivate static func detectIpodModel(with identifier: Identifier) -> DeviceModel {
        guard let major = identifier.version.major,
            let minor = identifier.version.minor,
            identifier.type == .iPod
            else { return .unknown }

        switch (major, minor) {
        case (1, 1):          return .iPodTouchFirstGen
        case (2, 1):          return .iPodTouchSecondGen
        case (3, 1):          return .iPodTouchThirdGen
        case (4, 1):          return .iPodTouchFourthGen
        case (5, 1):          return .iPodTouchFifthGen
        case (7, 1):          return .iPodTouchSixthGen
        default:              return .unknown
        }
    }
}


// MARK: Detecting Simulator Models

extension DeviceModel {
    fileprivate static func detectSimulatorModel() -> DeviceModel {
        guard let versionInfo = ProcessInfo.processInfo.environment["SIMULATOR_VERSION_INFO"],
            let startIdx = versionInfo.range(of: "DeviceType: ")?.upperBound else {
                return .unknown
        }
        let deviceType = versionInfo[startIdx..<versionInfo.endIndex]
        switch deviceType {
        case "iPhone 4s":               return .iPhone4S
        case "iPhone 5s":               return .iPhone5S
        case "iPhone 6":                return .iPhone6
        case "iPhone 6 Plus":           return .iPhone6Plus
        case "iPhone 6s":               return .iPhone6S
        case "iPhone 6s Plus":          return .iPhone6SPlus
        case "iPhone SE":               return .iPhoneSE
        case "iPhone 7":                return .iPhone7
        case "iPhone 7 Plus":           return .iPhone7Plus
        case "iPhone 8":                return .iPhone8
        case "iPhone 8 Plus":           return .iPhone8Plus
        case "iPhone X":                return .iPhoneX
        case "iPad (5th generation)":   return .iPadFifthGen
        case "iPad Air":                return .iPadAir
        case "iPad Air 2":              return .iPadAir2
        case "iPad Pro (9.7-inch)":     return .iPadPro9_7Inch
        case "iPad Pro (10.5-inch)":    return .iPadPro10_5Inch
        case "iPad Pro (12.9 inch)",
             "iPad Pro (12.9 inch) (2nd generation)":
                                        return .iPadPro12_9Inch
        default:                        return .unknown
        }
    }
}
