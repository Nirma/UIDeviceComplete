//
// Identifier.swift
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
        
        // Simulator Check
        if identifierString == "x86_64" || identifierString == "i386" {
            return (identifierString, nil, nil)
        }
        
        let numericCharacters: [String] = (0...9).map { "\($0)" }
        let type = identifierString.prefix(while: { !numericCharacters.contains(String($0))})

        let version = identifierString.suffix(from: type.endIndex)
            .split(separator: ",")
            .map { Int(String($0)) }

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
        case .simulator:
            return "Simulator"
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
        case (6, 2):
            return "iPhone 5S (Global)"
        case (5, 4):
            return "iPhone 5C (Global)"
        case (5, 3):
            return "iPhone 5C (GSM)"
        case (6, 1):
            return "iPhone 5S (GSM)"
        case (7, 2):
            return "iPhone 6"
        case (7, 1):
            return "iPhone 6 Plus"
        case (8, 4):
            return "iPhone SE (GSM)"
        case (8, 3):
            return "iPhone SE (GSM+CDMA)"
        case (8, 1):
            return "iPhone 6s"
        case (8, 2):
            return "iPhone 6s Plus"
        case (9, 1):
            return "iPhone 7"
        case (9, 3):
            return "iPhone 7"
        case (9, 4):
            return "iPhone 7 Plus"
        case (9, 2):
            return "iPhone 7 Plus"
        case (10, 1):
            return "iPhone 8"
        case (10, 4):
            return "iPhone 8"
        case (10, 2):
            return "iPhone 8 Plus"
        case (10, 5):
            return "iPhone 8 Plus"
        case (10, 6):
            return "iPhone X"
        case (10, 3):
            return "iPhone X"
        
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
        case (2, 4):
            return "2nd Gen iPad New Revision"
        case (2, 3):
            return "2nd Gen iPad CDMA"
        case (2, 2):
            return "2nd Gen iPad GSM"
        case (2, 7):
            return "iPad mini CDMA+LTE"
        case (2, 6):
            return "iPad mini GSM+LTE"
        case (2, 1):
            return "2nd Gen iPad"
        case (2, 5):
            return "iPad mini"
        case (3, 2):
            return "3rd Gen iPad CDMA"
        case (3, 5):
            return "4th Gen iPad GSM+LTE"
        case (3, 3):
            return "3rd Gen iPad GSM"
        case (3, 4):
            return "4th Gen iPad"
        case (3, 6):
            return "4th Gen iPad CDMA+LTE"
        case (3, 1):
            return "3rd Gen iPad"
        case (4, 1):
            return "iPad Air (WiFi)"
        case (4, 2):
            return "iPad Air (GSM+CDMA)"
        case (4, 9):
            return "iPad Mini 3 (China)"
        case (4, 8):
            return "iPad mini 3 (GSM+CDMA)"
        case (4, 6):
            return "iPad mini Retina (China)"
        case (4, 5):
            return "iPad mini Retina (GSM+CDMA)"
        case (4, 7):
            return "iPad mini 3 (WiFi)"
        case (4, 4):
            return "iPad mini Retina (WiFi)"
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
        case (6, 8):
            return "iPad Pro (12.9 inch, Wi-Fi+LTE)"
        case (6, 4):
            return "iPad Pro (9.7 inch, Wi-Fi+LTE)"
        case (6, 7):
            return "iPad Pro (12.9 inch, Wi-Fi)"
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
            
        default:
            return "unknown"
        }
    }
}
