//
// DeviceModel.swift
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

public enum DeviceModel: CaseIterable {
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
    
    case unknown
}

// MARK: - init

extension DeviceModel {
    init(identifier: Identifier) {
        self = DeviceModel.detectWatchModel(with: identifier)
    }
}

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
            
        default:                                    return .unknown
        }
    }
}
