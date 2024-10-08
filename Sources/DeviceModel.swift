//
// DeviceModel.swift
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

public enum DeviceModel: CaseIterable {

    #if os(iOS)
    case iPhone4, iPhone4S
    case iPhone5, iPhone5C, iPhone5S
    case iPhone6, iPhone6Plus
    case iPhone6S, iPhone6SPlus
    case iPhoneSE, iPhoneSE2, iPhoneSE3 
    case iPhone7, iPhone7Plus
    case iPhone8, iPhone8Plus
    case iPhoneX
    case iPhoneXS, iPhoneXSMax
    case iPhoneXR
    case iPhone11
    case iPhone11Pro, iPhone11ProMax
    case iPhone12mini, iPhone12
    case iPhone12Pro, iPhone12ProMax
    case iPhone13mini, iPhone13
    case iPhone13Pro, iPhone13ProMax
    case iPhone14, iPhone14Plus
    case iPhone14Pro, iPhone14ProMax
    case iPhone15, iPhone15Plus
    case iPhone15Pro, iPhone15ProMax
    case iPhone16, iPhone16Plus
    case iPhone16Pro, iPhone16ProMax

    case iPadFirstGen, iPadSecondGen, iPadThirdGen, iPadFourthGen, iPadFifthGen, iPadSixthGen, iPadSeventhGen, iPadEighthGen, iPadNinthGen, iPadTenthGen

    case iPadAir, iPadAir2, iPadAir3, iPadAir4, iPadAir5
    
    case iPadAir11InchM2, iPadAir13InchM2

    case iPadMini, iPadMini2, iPadMini3, iPadMini4, iPadMini5, iPadMini6

    case iPadPro9_7Inch, iPadPro10_5Inch, iPadPro12_9Inch, iPadPro12_9Inch_SecondGen
    
    case iPadPro11Inch, iPadPro12_9Inch_ThirdGen
    
    case iPadPro11Inch_SecondGen, iPadPro12_9Inch_FourthGen
    
    case iPadPro11Inch_ThirdGen, iPadPro12_9Inch_FifthGen
            
    case iPadPro11Inch_FourthGen, iPadPro12_9Inch_SixthGen
    
    case iPadPro11InchM4, iPadPro13InchM4

    case iPodTouchFirstGen, iPodTouchSecondGen, iPodTouchThirdGen,
         iPodTouchFourthGen, iPodTouchFifthGen, iPodTouchSixthGen, iPodTouchSeventhGen
    
    #elseif os(watchOS)
    case firstGen
    case series1
    case series2
    case series3
    case series4
    case series5
    case se
    case series6
    case series7
    case series8
    case se2
    case ultra
    case series9
    case ultra2
    case series10
    #endif
    
    case unknown
}


// MARK: - init

extension DeviceModel {
    init(identifier: Identifier) {
        switch identifier.type {
        #if os(iOS)
        case .iPhone:
            self = DeviceModel.detectIphoneModel(with: identifier)
        case .iPad:
            self = DeviceModel.detectIpadModel(with: identifier)
        case .iPod:
            self = DeviceModel.detectIpodModel(with: identifier)
        #elseif os(watchOS)
        case .watch:
            self = DeviceModel.detectWatchModel(with: identifier)
        #endif
        default:
            self = .unknown
        }
    }
}

#if os(iOS)
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
            
        case (11, 2):           return .iPhoneXS
        case (11, 4), (11, 6):  return .iPhoneXSMax
        case (11, 8):           return .iPhoneXR
            
        case (12, 1):           return .iPhone11
        case (12, 3):           return .iPhone11Pro
        case (12, 5):           return .iPhone11ProMax
            
        case (12, 8):           return .iPhoneSE2
            
        case (13, 1):           return .iPhone12mini
        case (13, 2):           return .iPhone12
        case (13, 3):           return .iPhone12Pro
        case (13, 4):           return .iPhone12ProMax
            
        case (14, 4):           return .iPhone13mini
        case (14, 5):           return .iPhone13
        case (14, 2):           return .iPhone13Pro
        case (14, 3):           return .iPhone13ProMax
            
        case (14, 6):           return .iPhoneSE3 

        case (14, 7):           return .iPhone14
        case (14, 8):           return .iPhone14Plus
            
        case (15, 2):           return .iPhone14Pro
        case (15, 3):           return .iPhone14ProMax
            
        case (15, 4):           return .iPhone15
        case (15, 5):           return .iPhone15Plus
            
        case (16, 1):           return .iPhone15Pro
        case (16, 2):           return .iPhone15ProMax
            
        case (17, 1):           return .iPhone16Pro
        case (17, 2):           return .iPhone16ProMax
        case (17, 3):           return .iPhone16
        case (17, 4):           return .iPhone16Plus
        
        default:                return .unknown
        }
    }
}
#endif

#if os(iOS)
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
        case (7, 5), (7, 6):                  return .iPadSixthGen
        case (7, 11), (7, 12):                return .iPadSeventhGen
        case (11, 6), (11, 7):                return .iPadEighthGen
        case (12, 1), (12, 2):                return .iPadNinthGen                
        case (13, 18), (13, 19):              return .iPadTenthGen
        case (4, 1), (4, 2), (4, 3):          return .iPadAir
        case (5, 3), (5, 4):                  return .iPadAir2
        case (11, 3), (11, 4):                return .iPadAir3
        case (13, 1), (13, 2):                return .iPadAir4
        case (13, 16), (13, 17):              return .iPadAir5
        case (14, 8), (14, 9):
                                              return .iPadAir11InchM2
        case (14, 10), (14, 11):
                                              return .iPadAir13InchM2
        case (2, 5), (2, 6), (2, 7):          return .iPadMini
        case (4, 4), (4, 5), (4, 6):          return .iPadMini2
        case (4, 7), (4, 8), (4, 9):          return .iPadMini3
        case (5, 1), (5, 2):                  return .iPadMini4
        case (11, 1), (11, 2):                return .iPadMini5
        case (14, 1), (14, 2):                return .iPadMini6
        case (6, 3), (6, 4):                  return .iPadPro9_7Inch
        case (7, 3), (7, 4):                  return .iPadPro10_5Inch
        case (8, 1), (8, 2), (8, 3), (8, 4):  return .iPadPro11Inch
        case (8, 9), (8, 10):                 return .iPadPro11Inch_SecondGen
        case (13, 4), (13, 5), (13, 6), (13, 7):
                                              return .iPadPro11Inch_ThirdGen
        case (14, 3), (14, 4):
                                              return .iPadPro11Inch_FourthGen
        case (6, 7), (6, 8):                  return .iPadPro12_9Inch
        case (7, 1), (7, 2):                  return .iPadPro12_9Inch_SecondGen
        case (8, 5), (8, 6), (8, 7), (8, 8):  return .iPadPro12_9Inch_ThirdGen
        case (8, 11), (8, 12):                return .iPadPro12_9Inch_FourthGen
        case (13, 8), (13, 9), (13, 10), (13, 11):
                                              return .iPadPro12_9Inch_FifthGen
        case (14, 5), (14, 6):
                                              return .iPadPro12_9Inch_SixthGen
        case (16, 3), (16, 4):
                                              return .iPadPro11InchM4
        case (16, 5), (16, 6):
                                              return .iPadPro13InchM4
        default:                              return .unknown
        }
    }
}
#endif

#if os(iOS)
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
        case (9, 1):          return .iPodTouchSeventhGen
        default:              return .unknown
        }
    }
}
#endif

#if os(watchOS)
// MARK: Detecting Apple Watch Models

extension DeviceModel {
    fileprivate static func detectWatchModel(with identifier: Identifier) -> DeviceModel {
        guard let major = identifier.version.major,
              let minor = identifier.version.minor
        else { return .unknown }
        
        switch (major, minor) {
        case (1, _):                                return .firstGen
        case (2, 3), (2, 4):                        return .series2
        case (2, 6), (2, 7):                        return .series1
        case (3, _):                                return .series3
        case (4, _):                                return .series4
        case (5, 1), (5, 2), (5, 3), (5, 4):        return .series5
        case (5, 9), (5, 10), (5, 11), (5, 12):     return .se
        case (6, 1), (6, 2), (6, 3), (6, 4):        return .series6
        case (6, 6), (6, 7), (6, 8), (6, 9):        return .series7
        case (6, 10), (6, 11), (6, 12), (6, 13):    return .se2
        case (6, 14), (6, 15), (6, 16), (6, 17):    return .series8
        case (6, 18):                               return .ultra
        case (7, 1), (7, 2), (7, 3), (7, 4):        return .series9
        case (7, 5):                                return .ultra2
        case (7, 8), (7, 9), (7, 10), (7, 11):      return .series10
        default:                                    return .unknown
        }
    }
}
#endif

#if os(iOS)
// MARK: Detecting the Notch

extension DeviceModel {
    public var hasNotch: Bool {
        switch self {

        case .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR:
            return true
        case .iPhone11, .iPhone11Pro, .iPhone11ProMax:
            return true
        case .iPhone12mini, .iPhone12, .iPhone12Pro, .iPhone12ProMax:
            return true
        case .iPhone13mini, .iPhone13, .iPhone13Pro, .iPhone13ProMax:
            return true
        case .iPhone14, .iPhone14Plus:
            return true
            
        default:
          return false
        }
    }
    
    public var hasDynamicIsland: Bool {
        switch self {
        case .iPhone14Pro, .iPhone14ProMax:
            return true
        case .iPhone15, .iPhone15Plus, .iPhone15Pro, .iPhone15ProMax:
            return true
        case .iPhone16, .iPhone16Plus, .iPhone16Pro, .iPhone16ProMax:
            return true
        default:
          return false
        }
    }
}
#endif
