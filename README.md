# ScrollViewKeyboardAvoider

![Platform](https://img.shields.io/badge/platform-iOS-333333.svg)
![Swift v4.2](https://img.shields.io/badge/swift-v4.2-orange.svg)
[![Maintainability](https://api.codeclimate.com/v1/badges/99f9fde64d0bede1d46c/maintainability)](https://codeclimate.com/github/darrarski/ScrollViewKeyboardAvoider/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/99f9fde64d0bede1d46c/test_coverage)](https://codeclimate.com/github/darrarski/ScrollViewKeyboardAvoider/test_coverage)
[![Build Status](https://travis-ci.org/darrarski/ScrollViewKeyboardAvoider.svg?branch=master)](https://travis-ci.org/darrarski/ScrollViewKeyboardAvoider)
[![CocoaPods](https://img.shields.io/cocoapods/v/ScrollViewKeyboardAvoider.svg)](https://cocoapods.org/pods/ScrollViewKeyboardAvoider)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Adjust insets in `UIScrollView` so the keyboard does not cover content.

## Install

Minimum deployment target: **iOS 10.0** (on **iOS 11** uses Safe Area Layout for iPhone X compatibility)

### CocoaPods

You can integrate `ScrollViewKeyboardAvoider` with your project using [CocoaPods](https://cocoapods.org). Just add this line to your `Podfile`:

```ruby
pod 'ScrollViewKeyboardAvoider', '~> 1.0'
```

### Carthage

You can also use [Carthage](https://github.com/Carthage/Carthage) if you prefer by adding following line to your `Cartfile`:

```
github "darrarski/ScrollViewKeyboardAvoider" ~> 1.0
```

## Use

You will need to setup keyboard frame observing, check out [KeyboardFrameChangeListener](https://github.com/darrarski/KeyboardFrameChangeListener) if you need a simple solution. You can also check [ScrollViewController](https://github.com/darrarski/ScrollViewController) which wrapps your custom view and handles all the logic automatically.

Example can be found in [DemoApp](DemoApp).

**TL;DR**

```swift
let avoider: ScrollViewKeyboardAvoiding = ScrollViewKeyboardAvoider(
    animator: { UIView.animate(withDuration: $0, animations: $1) }
)

let scrollView: UIScrollView
let newKeyboardFrame: CGRect
let keyboardAnimationDuration: TimeInterval

avoider.handleKeyboardFrameChange(newKeyboardFrame,
                                  animationDuration: keyboardAnimationDuration,
                                  for: scrollView)
```

## Develop

Requirements: 

- Ruby with [Bundler](http://bundler.io)
- Xcode 10

To bootstrap the project run:

```sh
bundle install
bundle exec fastlane setup
```

Then open `ScrollViewKeyboardAvoider.xcodeproj` in Xcode.

Use `DemoApp` build scheme for building and runing demo app.

Use `Tests` build scheme for runing tests.

To run tests from command line execute:

```sh
bundle exec fastlane test
```

To generate and open test coverage report in HTML format, run:

```sh
bundle exec fastlane coverage
```

## License

MIT License - check out [LICENSE](LICENSE) file.
