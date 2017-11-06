import Quick
import Nimble
@testable import KeyboardFrameChangeListener
@testable import ScrollViewKeyboardAvoider

class ScrollViewKeyboardAvoiderSpec: QuickSpec {

    override func spec() {
        describe("ScrollViewKeyboardAvoider") {
            var sut: ScrollViewKeyboardAvoider!
            var didAnimateWithDuration: TimeInterval?

            beforeEach {
                sut = ScrollViewKeyboardAvoider(animator: { (duration, animations) in
                    didAnimateWithDuration = duration
                    animations()
                })
            }

            describe("scroll view without superview") {
                var scrollView: UIScrollViewSpy!

                beforeEach {
                    scrollView = UIScrollViewSpy()
                }

                context("keyboard frame changes") {
                    beforeEach {
                        let change = KeyboardFrameChange(frame: .zero, animationDuration: 0)
                        sut.handleKeyboardFrameChange(change, for: scrollView)
                    }

                    it("should not animate") {
                        expect(didAnimateWithDuration).to(beNil())
                    }

                    it("should not update layout") {
                        expect(scrollView.layoutIfNeededCalled).to(beFalse())
                    }
                }
            }

            describe("portrait screen") {
                var screenSize: CGSize!

                beforeEach {
                    screenSize = CGSize(width: 320, height: 480)
                }

                describe("full screen scroll view") {
                    var scrollView: UIScrollViewSpy!
                    var superview: UIView!

                    beforeEach {
                        scrollView = fullScreenScrollView(screenSize: screenSize)
                        superview = UIView(frame: CGRect(origin: .zero, size: screenSize))
                        superview.addSubview(scrollView)
                    }

                    context("standard keyboard becomes fully visible") {
                        var change: KeyboardFrameChange!

                        beforeEach {
                            change = standardKeyboardFullyVisible(screenSize: screenSize)
                            sut.handleKeyboardFrameChange(change, for: scrollView)
                        }

                        it("should animate with correct duration") {
                            expect(didAnimateWithDuration).to(equal(change.animationDuration))
                        }

                        it("should set correct bottom content inset") {
                            expect(scrollView.contentInset.bottom).to(equal(change.frame.size.height))
                        }

                        it("should set correct bottom indicator inset") {
                            expect(scrollView.scrollIndicatorInsets.bottom).to(equal(change.frame.size.height))
                        }

                        it("should update layout") {
                            expect(scrollView.layoutIfNeededCalled).to(beTrue())
                        }
                    }

                    context("standard keyboard becomes not visible") {
                        var change: KeyboardFrameChange!

                        beforeEach {
                            change = standardKeyboardNotVisible(screenSize: screenSize)
                            sut.handleKeyboardFrameChange(change, for: scrollView)
                        }

                        it("should animate with correct duration") {
                            expect(didAnimateWithDuration).to(equal(change.animationDuration))
                        }

                        it("should set correct bottom content inset") {
                            expect(scrollView.contentInset.bottom).to(equal(0))
                        }

                        it("should set correct bottom indicator inset") {
                            expect(scrollView.scrollIndicatorInsets.bottom).to(equal(0))
                        }
                    }

                    context("standard keyboard becomes partially visible") {
                        var change: KeyboardFrameChange!

                        beforeEach {
                            change = standardKeyboardPartiallyVisible(screenSize: screenSize)
                            sut.handleKeyboardFrameChange(change, for: scrollView)
                        }

                        it("should animate with correct duration") {
                            expect(didAnimateWithDuration).to(equal(change.animationDuration))
                        }

                        it("should set correct bottom content inset") {
                            expect(scrollView.contentInset.bottom).to(equal(change.frame.size.height / 2))
                        }

                        it("should set correct bottom indicator inset") {
                            expect(scrollView.scrollIndicatorInsets.bottom).to(equal(change.frame.size.height / 2))
                        }
                    }
                }

                describe("full screen scroll view with margins") {
                    var scrollView: UIScrollView!
                    var margin: CGFloat!
                    var superview: UIView!

                    beforeEach {
                        margin = 20
                        scrollView = fullScreenScrollView(screenSize: screenSize, margin: margin)
                        superview = UIView(frame: CGRect(origin: .zero, size: screenSize))
                        superview.addSubview(scrollView)
                    }

                    context("standard keyboard becomes fully visible") {
                        var change: KeyboardFrameChange!

                        beforeEach {
                            change = standardKeyboardFullyVisible(screenSize: screenSize)
                            sut.handleKeyboardFrameChange(change, for: scrollView)
                        }

                        it("should animate with correct duration") {
                            expect(didAnimateWithDuration).to(equal(change.animationDuration))
                        }

                        it("should set correct bottom content inset") {
                            expect(scrollView.contentInset.bottom).to(equal(change.frame.size.height - margin))
                        }

                        it("should set correct bottom indicator inset") {
                            expect(scrollView.scrollIndicatorInsets.bottom).to(equal(change.frame.size.height - margin))
                        }
                    }

                    context("standard keyboard becomes not visible") {
                        var change: KeyboardFrameChange!

                        beforeEach {
                            change = standardKeyboardNotVisible(screenSize: screenSize)
                            sut.handleKeyboardFrameChange(change, for: scrollView)
                        }

                        it("should animate with correct duration") {
                            expect(didAnimateWithDuration).to(equal(change.animationDuration))
                        }

                        it("should set correct bottom content inset") {
                            expect(scrollView.contentInset.bottom).to(equal(0))
                        }

                        it("should set correct bottom indicator inset") {
                            expect(scrollView.scrollIndicatorInsets.bottom).to(equal(0))
                        }
                    }

                    context("standard keyboard becomes partially visible") {
                        var change: KeyboardFrameChange!

                        beforeEach {
                            change = standardKeyboardPartiallyVisible(screenSize: screenSize)
                            sut.handleKeyboardFrameChange(change, for: scrollView)
                        }

                        it("should animate with correct duration") {
                            expect(didAnimateWithDuration).to(equal(change.animationDuration))
                        }

                        it("should set correct bottom content inset") {
                            expect(scrollView.contentInset.bottom).to(equal(change.frame.size.height / 2 - margin))
                        }

                        it("should set correct bottom indicator inset") {
                            expect(scrollView.scrollIndicatorInsets.bottom).to(equal(change.frame.size.height / 2 - margin))
                        }
                    }
                }
            }
        }

        func fullScreenScrollView(screenSize: CGSize, margin: CGFloat = 0) -> UIScrollViewSpy {
            return UIScrollViewSpy(frame: CGRect(origin: .zero, size: screenSize).insetBy(dx: margin, dy: margin))
        }

        func standardKeyboardFullyVisible(screenSize: CGSize) -> KeyboardFrameChange {
            let size = CGSize(width: screenSize.width, height: 100)
            let frame = CGRect(
                origin: CGPoint(
                    x: 0,
                    y: screenSize.height - size.height
                ),
                size: size
            )
            return KeyboardFrameChange(frame: frame, animationDuration: 0.3)
        }

        func standardKeyboardPartiallyVisible(screenSize: CGSize) -> KeyboardFrameChange {
            let size = CGSize(width: screenSize.width, height: 100)
            let frame = CGRect(
                origin: CGPoint(
                    x: 0,
                    y: screenSize.height - (size.height / 2)
                ),
                size: size
            )
            return KeyboardFrameChange(frame: frame, animationDuration: 0.5)
        }

        func standardKeyboardNotVisible(screenSize: CGSize) -> KeyboardFrameChange {
            let size = CGSize(width: screenSize.width, height: 100)
            let frame = CGRect(
                origin: CGPoint(
                    x: 0,
                    y: screenSize.height
                ),
                size: size
            )
            return KeyboardFrameChange(frame: frame, animationDuration: 0.7)
        }
    }

    private class UIScrollViewSpy: UIScrollView {

        var layoutIfNeededCalled = false

        // MARK: UIScrollView

        override func layoutIfNeeded() {
            super.layoutIfNeeded()
            layoutIfNeededCalled = true
        }

    }

}
