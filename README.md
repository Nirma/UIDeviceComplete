# UIDeviceComplete
UIDevice extensions that fill in the missing pieces.

[![Build Status](https://travis-ci.org/Nirma/UIDeviceComplete.svg?branch=master)](https://travis-ci.org/Nirma/UIDeviceComplete)
![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![CodeCov](https://img.shields.io/codecov/c/github/Nirma/UIDeviceComplete.svg)](https://codecov.io/gh/Nirma/UIDeviceComplete)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/UIDeviceComplete.svg)](#cocoapods)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
 [![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

# Whats this library about?
`UIDeviceComplete` is an iOS library intended to be a collection of extensions to `UIDevice` 
that provides functionality that `UIDevice` currently lacks like determining which iOS device
you have (i.e iPhone X, iPhone 8, iPhone SE, iPad Pro, iPhone 7 etc) or determining the screen size of the device
in inches.

# Features
- [x] Detect specific device like iPhone 7, iPhone SE or iPad Pro
- [x] Get screen size of device in inches
- [x] Get iOS Device family (iPod, iPhone or iPad)

### Dont see a feature you need?
Feel free to open an Issue requesting the feature you want or send over a pull request!

# Use
All of the extensions are called off of the `dc` variable which ***stands for ([UI]DeviceComplete)*** object that this 
library extends onto `UIDevice` that way native methods of `UIDevice` and methods of this library can
easily be seen, also lowering the possibility of naming conflicts.


### Getting common device name

```swift 
UIDevice.current.dc.commonDeviceName // iPad Pro (12.9 inch, Wi-Fi+LTE)
```

### Detecting iOS Device models

```Swift
let device = UIDevice.current.dc.deviceModel

switch device {
    case .iPhoneX:
        print("So hows that iPhone X notch thing working out? Right...")
    case .iPhone6Plus, .iPhone7Plus:
        print("Lots of screen realestate eh?")
    case .iPhoneSE, .iPhone5, iPhone5S:
        print("Less iPhone is more iPhone...")
    case .iPadPro:
        print("Why?")
    default:
        print("Not sure what this is...")
}
```

### Detecting iOS Device Screen Size (Inches)

Screen size can be be queried with the following computed property returning a simple `Double`
that represents the screen size in inches:

```swift
let screenSize: Double = UIDevice.current.dc.screenSize.sizeInches

if screenSize <= 4.0 {
    print("Modest screen size; not so modest price tag")
} else if screenSize >= 5.5 {
    print("Plus is always a plus")
} else {
    print("Chances are this is an iPad or an iPhone (Texas Edition).")
}
```

### Detecting iOS Device Family

If the type of device family is all you are after i.e iPhone or iPad and the specific model
is not important then `DeviceFamily` might be what you need.

```Swift
let deviceFamily = UIDevice.current.dc.deviceFamily

switch deviceFamily {
    case .iPhone:
        print("...phone home?")
    case .iPad:
        print("when it comes to screen size; more is more")
    case .iPod:
        print("Why not?")
    default:
        print("No family...")
}
```

## Installation

#### Carthage

If you use Carthage to manage your dependencies, simply add
UIDeviceComplete to your `Cartfile`:

```
github "Nirma/UIDeviceComplete"
```

If you use Carthage to build your dependencies, make sure you have added `UIDeviceComplete.framework` to the "_Linked Frameworks and Libraries_" section of your target, and have included `UIDeviceComplete.framework` in your Carthage framework copying build phase.

#### CocoaPods

If you use CocoaPods to manage your dependencies, simply add
this line to your `Podfile`:

```
use_frameworks!
pod 'UIDeviceComplete'
```


## Contributing to this project
**Contributions are highly welcome**

If there is something you wish to fix about the project, or wish to add any other kind of enhancements,
propose to add to the project. Please feel free to send over a pull request 
or open an issue for this project.

## License

UIDeviceComplete is released under the MIT license. [See LICENSE](https://github.com/Nirma/UIDeviceComplete/blob/master/LICENSE) for details.
