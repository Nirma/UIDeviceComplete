//
// Identifier.swift
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

struct Identifier {
    let type: DeviceFamily
    let version: (major: Int?, minor: Int?)

    init(_ identifier: String) {
        let (type, major, minor) = Identifier.typeVersionComponents(with: identifier)
        self.type = DeviceFamily(rawValue: type)
        self.version = (major, minor)
    }
}


// MARK: - Identifier String parsing

extension Identifier {
    static func typeVersionComponents(with identifierString: String) -> (type: String, major: Int?, minor: Int?) {
        
        let numericCharacters: [String] = (0...9).map { "\($0)" }
        let type = identifierString.prefix(while: { !numericCharacters.contains(String($0))})

        let version = identifierString.suffix(from: type.endIndex)
            .split(separator: ",")
            .map { Int($0) }

        let major: Int? = !version.isEmpty ? version[0] : nil
        let minor: Int? = version.count > 1 ? version[1] : nil

        return (String(type), major, minor)
    }
}


// MARK: - String Representation - iPhone

extension Identifier: CustomStringConvertible {
    var description: String {

        guard let major = version.major,
            let minor = version.minor
            else { return "unknown" }

        switch type {
        case .iPhone:
            return iphoneStringRepresentation(major: major, minor: minor)
        case .iPad:
            return iPadStringRepresentation(major: major, minor: minor)
        case .iPod:
            return iPodStringRepresentation(major: major, minor: minor)
        case .unknown:
            return "unknown"
        }
    }

    private func iphoneStringRepresentation(major: Int, minor: Int) -> String {
        switch (major, minor) {
        case (1, 1):
            return "iPhone"
        case (1, 2):
            return "iPhone 3G"
        case (2, 1):
            return "iPhone 3GS"
        case (3, 1):
            return "iPhone 4"
        case (3, 2):
            return "iPhone 4 GSM Rev A"
        case (3, 3):
            return "iPhone 4 CDMA"
        case (4, 1):
            return "iPhone 4S"
        case (5, 1):
            return "iPhone 5 GSM+LTE"
        case (5, 2):
            return "iPhone 5 CDMA+LTE"
        case (5, 3):
            return "iPhone 5C (GSM)"
        case (5, 4):
            return "iPhone 5C (Global)"
        case (6, 1):
            return "iPhone 5S (GSM)"
        case (6, 2):
            return "iPhone 5S (Global)"
        case (7, 1):
            return "iPhone 6 Plus"
        case (7, 2):
            return "iPhone 6"
        case (8, 1):
            return "iPhone 6s"
        case (8, 2):
            return "iPhone 6s Plus"
        case (8, 3):
            return "iPhone SE (GSM+CDMA)"
        case (8, 4):
            return "iPhone SE (GSM)"
        case (9, 1):
            return "iPhone 7"
        case (9, 2):
            return "iPhone 7 Plus"
        case (9, 3):
            return "iPhone 7"
        case (9, 4):
            return "iPhone 7 Plus"
        case (10, 1):
            return "iPhone 8"
        case (10, 2):
            return "iPhone 8 Plus"
        case (10, 3):
            return "iPhone X"
        case (10, 4):
            return "iPhone 8"
        case (10, 5):
            return "iPhone 8 Plus"
        case (10, 6):
            return "iPhone X"
        case (11, 2):
            return "iPhone XS"
        case (11, 4):
            return "iPhone XS Max"
        case (11, 6):
            return "iPhone XS Max (China)"
        case (11, 8):
            return "iPhone XR"
        case (12, 1):
            return "iPhone 11"
        case (12, 3):
            return "iPhone 11 Pro"
        case (12, 5):
            return "iPhone 11 Pro Max"
        case (12, 8):
            return "iPhone SE (2nd Gen)"
        case (13, 1):
            return "iPhone 12 mini"
        case (13, 2):
            return "iPhone 12"
        case (13, 3):
            return "iPhone 12 Pro"
        case (13, 4):
            return "iPhone 12 Pro Max"
        case (14, 2):
            return "iPhone 13 Pro"
        case (14, 3):
            return "iPhone 13 Pro Max"
        case (14, 4):
            return "iPhone 13 mini"
        case (14, 5):
            return "iPhone 13"
        case (14, 6):
            return "iPhone SE (3rd Gen)"

        default:
            return "unknown"
        }
    }

    private func iPodStringRepresentation(major: Int, minor: Int) -> String {
        switch (major, minor) {
        case (1, 1):
            return "1st Gen iPod"
        case (2, 1):
            return "2nd Gen iPod"
        case (3, 1):
            return "3rd Gen iPod"
        case (4, 1):
            return "4th Gen iPod"
        case (5, 1):
            return "5th Gen iPod"
        case (7, 1):
            return "6th Gen iPod"
        case (9, 1):
            return "7th Gen iPod"
        default:
            return "unknown"
        }
    }

    private func iPadStringRepresentation(major: Int, minor: Int) -> String {
        switch (major, minor) {
        case (1, 1):
            return "iPad"
        case (1, 2):
            return "iPad 3G"
        case (2, 1):
            return "2nd Gen iPad"
        case (2, 2):
            return "2nd Gen iPad GSM"
        case (2, 3):
            return "2nd Gen iPad CDMA"
        case (2, 4):
            return "2nd Gen iPad New Revision"
        case (2, 5):
            return "iPad mini"
        case (2, 6):
            return "iPad mini GSM+LTE"
        case (2, 7):
            return "iPad mini CDMA+LTE"
        case (3, 1):
            return "3rd Gen iPad"
        case (3, 2):
            return "3rd Gen iPad CDMA"
        case (3, 3):
            return "3rd Gen iPad GSM"
        case (3, 4):
            return "4th Gen iPad"
        case (3, 5):
            return "4th Gen iPad GSM+LTE"
        case (3, 6):
            return "4th Gen iPad CDMA+LTE"
        case (4, 1):
            return "iPad Air (WiFi)"
        case (4, 2):
            return "iPad Air (GSM+CDMA)"
        case (4, 3):
            return "iPad Air (China)"
        case (4, 4):
            return "iPad mini Retina (WiFi)"
        case (4, 5):
            return "iPad mini Retina (GSM+CDMA)"
        case (4, 6):
            return "iPad mini Retina (China)"
        case (4, 7):
            return "iPad mini 3 (WiFi)"
        case (4, 8):
            return "iPad mini 3 (GSM+CDMA)"
        case (4, 9):
            return "iPad mini 3 (China)"
        case (5, 1):
            return "iPad mini 4 (WiFi)"
        case (5, 2):
            return "iPad mini 4 (WiFi+LTE)"
        case (5, 3):
            return "iPad Air 2 (WiFi)"
        case (5, 4):
            return "iPad Air 2 (Cellular)"
        case (6, 3):
            return "iPad Pro (9.7 inch, Wi-Fi)"
        case (6, 4):
            return "iPad Pro (9.7 inch, Wi-Fi+LTE)"
        case (6, 7):
            return "iPad Pro (12.9 inch, Wi-Fi)"
        case (6, 8):
            return "iPad Pro (12.9 inch, Wi-Fi+LTE)"
        case (6, 11):
            return "5th Gen iPad (WiFi)"
        case (6, 12):
            return "5th Gen iPad (Cellular)"
        case (7, 1):
            return "2nd Gen iPad Pro (12.9 inch, Wi-Fi)"
        case (7, 2):
            return "2nd Gen iPad Pro (12.9 inch, Wi-Fi+LTE)"
        case (7, 3):
            return "iPad Pro (10.5 inch, Wi-Fi)"
        case (7, 4):
            return "iPad Pro (10.5 inch, Wi-Fi+LTE)"
        case (7 ,5):
            return "6th Gen iPad (WiFi)"
        case (7, 6):
            return "6th Gen iPad (Cellular)"
        case (7 ,11):
            return "7th Gen iPad (10.2 inch, WiFi)"
        case (7, 12):
            return "7th Gen iPad (10.2 inch, Cellular)"
        case (8, 1):
            return "iPad Pro (11 inch, Wi-Fi)"
        case (8, 2):
            return "iPad Pro (11 inch, Wi-Fi, 1TB)"
        case (8, 3):
            return "iPad Pro (11 inch, Wi-Fi+LTE)"
        case (8, 4):
            return "iPad Pro (11 inch, Wi-Fi+LTE, 1TB)"
        case (8, 5):
            return "3rd Gen iPad Pro (12.9 inch, Wi-Fi)"
        case (8, 6):
            return "3rd Gen iPad Pro (12.9 inch, Wi-Fi, 1TB)"
        case (8, 7):
            return "3rd Gen iPad Pro (12.9 inch, Wi-Fi+LTE)"
        case (8, 8):
            return "3rd Gen iPad Pro (12.9 inch, Wi-Fi+LTE, 1TB)"
        case (8, 9):
            return "2nd Gen iPad Pro (11 inch, Wi-Fi)"
        case (8, 10):
            return "2nd Gen iPad Pro (11 inch, Wi-Fi+LTE)"
        case (8, 11):
            return "4th Gen iPad Pro (12.9 inch, Wi-Fi)"
        case (8, 12):
            return "4th Gen iPad Pro (12.9 inch, Wi-Fi+LTE)"
        case (11, 1):
            return "5th Gen iPad Mini (Wi-Fi)"
        case (11, 2):
            return "5th Gen iPad Mini (Wi-Fi+LTE)"
        case (11, 3):
            return "3rd Gen iPad Air (Wi-Fi)"
        case (11, 4):
            return "3rd Gen iPad Air (Wi-Fi+LTE)"
        case (13, 1):
            return "4th Gen iPad Air (Wi-Fi)"
        case (13, 16):
            return "5th Gen iPad Air (Wi-Fi)"
        case (13, 17):
            return "5th Gen iPad Air (Wi-Fi+5G)"
        case (13, 2):
            return "4th Gen iPad Air (Wi-Fi+LTE)"
        case (11, 6):
            return "8th Gen iPad (10.2 inch, WiFi)"
        case (11, 7):
            return "8th Gen iPad (10.2 inch, Cellular)"
        case (13, 4):
            return "3rd Gen iPad Pro (11 inch, Wi-Fi)"
        case (13, 5):
            return "3rd Gen iPad Pro (11 inch, Wi-Fi, 16GB RAM)"
        case (13, 6):
            return "3rd Gen iPad Pro (11 inch, Wi-Fi+5G)"
        case (13, 7):
            return "3rd Gen iPad Pro (11 inch, Wi-Fi+5G, 16GB RAM)"
        case (13, 8):
            return "5th Gen iPad Pro (12.9 inch, Wi-Fi)"
        case (13, 9):
            return "5th Gen iPad Pro (12.9 inch, Wi-Fi, 16GB RAM)"
        case (13, 10):
            return "5th Gen iPad Pro (12.9 inch, Wi-Fi+5G)"
        case (13, 11):
            return "5th Gen iPad Pro (12.9 inch, Wi-Fi+5G, 16GB RAM)"
        case (12, 1):
            return "9th Gen iPad (10.2 inch, Wi-Fi)"
        case (12, 2):
            return "9th Gen iPad (10.2 inch, Wi-Fi+LTE)"
        case (14, 1):
            return "6th Gen iPad mini (8.3 inch, Wi-Fi)"
        case (14, 2):
            return "6th Gen iPad mini (8.3 inch, Wi-Fi+5G)"
        default:
            return "unknown"
        }
    }
}
