//
// Identifier.swift
//
// Copyright (c) 2017 Nicholas Maccharoli
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

    init(identifier: String) {
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
        let type = identifierString.characters.prefix(while: { !numericCharacters.contains(String($0))})

        let version = identifierString.characters.suffix(from: type.endIndex)
            .split(separator: ",")
            .map { Int(String($0)) }

        let major: Int? = !version.isEmpty ? version[0] : nil
        let minor: Int? = version.count > 1 ? version[1] : nil

        return (String(type), major, minor)
    }
}
