//
// Screen.swift
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

public struct Screen {
    init(width: Double, height: Double, scale: Double) {
        self.width = width
        self.height = height
        self.scale = scale
    }

    public let width: Double
    public let height: Double
    public let scale: Double

    public var adjustedScale: Double {
        return 1.0 / scale
    }
}


// MARK: - Detecting Screen size in Inches

extension Screen {
    public var sizeInches: Double? {
        switch (height, scale) {
        case (480, _): return 3.5
        case (568, _): return 4.0
        case (667, 3.0), (736, _): return 5.5
        case (667, 1.0), (667, 2.0): return 4.7
        case (812, 3.0): return 5.8
        case (1024, _): return ipadSize1024()
        case (1112, _): return 10.5
        case (1366, _): return 12.9
        default: return nil
        }
    }

    func ipadSize1024() -> Double {
        let deviceModel = UIDevice().dc.deviceModel
        switch deviceModel {
        case .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4: return 7.9
        case .iPadPro10_5Inch: return 10.5
        default: return 9.7
        }
    }
}
