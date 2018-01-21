//
// System.swift
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

class System {
    static var name: String? {
        var systemInfo = utsname()
        uname(&systemInfo)

        // TODO: Find the source of the extra newlines that are getting appended in the end
        // the cause of this could just be a larger buffer than nessisary getting allocated
        // and the rest of the string being zeroed out.
        let encoding: UInt = String.Encoding.ascii.rawValue
        if let string = NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: encoding) {
            return (string as String).components(separatedBy: "\0").first
        }
        return nil
    }
}
