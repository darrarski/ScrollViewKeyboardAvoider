# ScrollViewKeyboardAvoider

![Platform](https://img.shields.io/badge/platform-iOS-333333.svg)
![Swift v4.0](https://img.shields.io/badge/swift-v4.0-orange.svg)
[![Build Status](https://travis-ci.org/darrarski/ScrollViewKeyboardAvoider.svg?branch=master)](https://travis-ci.org/darrarski/KeyboardFrameChangeListener)
[![CocoaPods](https://img.shields.io/cocoapods/v/ScrollViewKeyboardAvoider.svg)](https://cocoapods.org/pods/ScrollViewKeyboardAvoider)

Make UIScrollView adjust insets so the keyboard does not cover content.

## Install

You can integrate `ScrollViewKeyboardAvoider` with your project using [CocoaPods](https://cocoapods.org). Just add this line to your `Podfile`:

```ruby
pod 'ScrollViewKeyboardAvoider', '~> 1.0'
```

## Use

Check out included [DemoApp](DemoApp).

## Develop

Requirements: 

- Ruby with [Bundler](http://bundler.io)
- Xcode 9

To bootstrap the project run:

```sh
bundle install
bundle exec fastlane setup
```

Then open `ScrollViewKeyboardAvoider.xcworkspace` in Xcode.

Use `DemoApp` build scheme for building and runing demo app.

Use `Tests` build scheme for runing tests.

To run tests from command line execute:

```sh
bundle exec fastlane test
```

## License

MIT License - check out [LICENSE](LICENSE) file.
