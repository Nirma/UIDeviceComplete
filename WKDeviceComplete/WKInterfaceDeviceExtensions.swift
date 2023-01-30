//
// WKInterfaceDeviceExtensions.swift
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

import WatchKit

public extension WKDeviceComplete where Base == WKInterfaceDevice {

    private var identifier: Identifier? {
        return System.name.flatMap {
            return Identifier($0)
        }
    }
    
    /// Specific model i.e iphone7 or iPhone7s
    var deviceModel: DeviceModel {
        return identifier.flatMap { DeviceModel(identifier: $0) } ?? .unknown
    }

    /// Common name for device i.e "iPhone 7 Plus"
    var commonDeviceName: String {
        return identifier?.description ?? "unknown"
    }

}

// MARK: - Screen Size Detection

public extension WKDeviceComplete where Base == WKInterfaceDevice {
    var screenSize: Screen? {
        guard let identifier else { return nil }
        return Screen(identifier: identifier)
    }
}
