//
// Identifier.swift
//
// Copyright (c) 2017-2023 Nicholas Maccharoli
// Copyright (c) 2023 Vincent Neo
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
    let version: (major: Int?, minor: Int?)

    init(_ identifier: String) {
        let (major, minor) = Identifier.typeVersionComponents(with: identifier)
        self.version = (major, minor)
    }
}


// MARK: - Identifier String parsing

extension Identifier {
    static func typeVersionComponents(with identifierString: String) -> (major: Int?, minor: Int?) {
        
        let numericCharacters: [String] = (0...9).map { "\($0)" }
        let type = identifierString.prefix(while: { !numericCharacters.contains(String($0))})

        let version = identifierString.suffix(from: type.endIndex)
            .split(separator: ",")
            .map { Int($0) }

        let major: Int? = !version.isEmpty ? version[0] : nil
        let minor: Int? = version.count > 1 ? version[1] : nil

        return (major, minor)
    }
}


// MARK: - String Representation - Watch

extension Identifier: CustomStringConvertible {
    var description: String {
        
        guard let major = version.major,
              let minor = version.minor
        else { return "unknown" }
        
        return watchStringRepresentable(major: major, minor: minor)
    }
    
    private func watchStringRepresentable(major: Int, minor: Int) -> String {
        switch (major, minor) {
        case (1, 1):
            return "Apple Watch (1st generation), 38mm case"
        case (1, 2):
            return "Apple Watch (1st generation), 42mm case"
        case (2, 3):
            return "Apple Watch Series 2, 38mm case"
        case (2, 4):
            return "Apple Watch Series 2, 42mm case"
        case (2, 6):
            return "Apple Watch Series 1, 38mm case"
        case (2, 7):
            return "Apple Watch Series 1, 42mm case"
        case (3, 1):
            return "Apple Watch Series 3, 38mm case (GPS + Cellular)"
        case (3, 2):
            return "Apple Watch Series 3, 42mm case (GPS + Cellular)"
        case (3, 3):
            return "Apple Watch Series 3, 38mm case (GPS)"
        case (3, 4):
            return "Apple Watch Series 3, 42mm case (GPS)"
        case (4, 1):
            return "Apple Watch Series 4, 40mm case (GPS)"
        case (4, 2):
            return "Apple Watch Series 4, 44mm case (GPS)"
        case (4, 3):
            return "Apple Watch Series 4, 40mm case (GPS + Cellular)"
        case (4, 4):
            return "Apple Watch Series 4, 44mm case (GPS + Cellular)"
        case (5, 1):
            return "Apple Watch Series 5, 40mm case (GPS)"
        case (5, 2):
            return "Apple Watch Series 5, 44mm case (GPS)"
        case (5, 3):
            return "Apple Watch Series 5, 40mm case (GPS + Cellular)"
        case (5, 4):
            return "Apple Watch Series 5, 44mm case (GPS + Cellular)"
        case (5, 9):
            return "Apple Watch SE, 40mm case (GPS)"
        case (5, 10):
            return "Apple Watch SE, 44mm case (GPS)"
        case (5, 11):
            return "Apple Watch SE, 40mm case (GPS + Cellular)"
        case (5, 12):
            return "Apple Watch SE, 44mm case (GPS + Cellular)"
        case (6, 1):
            return "Apple Watch Series 6, 40mm case (GPS)"
        case (6, 2):
            return "Apple Watch Series 6, 44mm case (GPS)"
        case (6, 3):
            return "Apple Watch Series 6, 40mm case (GPS + Cellular)"
        case (6, 4):
            return "Apple Watch Series 6, 44mm case (GPS + Cellular)"
        case (6, 6):
            return "Apple Watch Series 7, 41mm case (GPS)"
        case (6, 7):
            return "Apple Watch Series 7, 45mm case (GPS)"
        case (6, 8):
            return "Apple Watch Series 7, 41mm case (GPS + Cellular)"
        case (6, 9):
            return "Apple Watch Series 7, 45mm case (GPS + Cellular)"
        case (6, 10):
            return "Apple Watch SE (2nd Generation), 40mm case (GPS)"
        case (6, 11):
            return "Apple Watch SE (2nd Generation), 44mm case (GPS)"
        case (6, 12):
            return "Apple Watch SE (2nd Generation), 40mm case (GPS + Cellular)"
        case (6, 13):
            return "Apple Watch SE (2nd Generation), 44mm case (GPS + Cellular)"
        case (6, 14):
            return "Apple Watch Series 8, 41mm case (GPS)"
        case (6, 15):
            return "Apple Watch Series 8, 45mm case (GPS)"
        case (6, 16):
            return "Apple Watch Series 8, 41mm case (GPS + Cellular)"
        case (6, 17):
            return "Apple Watch Series 8, 45mm case (GPS + Cellular)"
        case (6, 18):
            return "Apple Watch Ultra"
        default:
            return "unknown"
        }
    }
    
}
