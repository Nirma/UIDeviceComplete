//
// Screen.swift
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

public struct Screen {
    let caseSize: Int?
}

extension Screen {
    init(identifier: Identifier) {
        self.caseSize = Screen.detectCaseSize(with: identifier)
    }
}

// MARK: - Detecting Screen size by model, in mm

extension Screen {
    fileprivate static func detectCaseSize(with identifier: Identifier) -> Int? {
        guard let major = identifier.version.major,
              let minor = identifier.version.minor
        else { return nil }
        
        switch (major, minor) {
        case (1, 1), (2, 3), (2, 6), (3, 1), (3, 3):        return 38
        case (1, 2), (2, 4), (2, 7), (3, 2), (3, 4):        return 42
            
        case (4, 1), (4, 3), (5, 1), (5, 3), (5, 9),
             (5, 11), (6, 1), (6, 3), (6, 10), (6, 12):     return 40
        case (4, 2), (4, 4), (5, 2), (5, 4), (5, 10),
             (5, 12), (6, 2), (6, 4), (6, 11), (6, 13):     return 44
            
        case (6, 6), (6, 8), (6, 14), (6, 16),
             (7, 1), (7, 3):                                return 41
        case (6, 7), (6, 9), (6, 15), (6, 17),
             (7, 2), (7, 4):                                return 45
            
        case (6, 18), (7, 5):                               return 49
            
        default:                                            return nil
        }
    }
}
