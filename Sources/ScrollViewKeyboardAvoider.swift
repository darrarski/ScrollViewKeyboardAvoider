import UIKit
import KeyboardFrameChangeListener

/// ScrollViewKeyboardAvoiding implementation
public class ScrollViewKeyboardAvoider: ScrollViewKeyboardAvoiding {

    /// Animates using provided duration and closure
    public typealias Animator = (TimeInterval, @escaping () -> Void) -> Void

    /// Create new avoider
    ///
    /// - Parameter animator: used to perform animations
    public init(animator: @escaping Animator) {
        self.animate = animator
    }

    // MARK: ScrollViewKeyboardAvoiding

    /// Handle keyboard frame change
    ///
    /// - Parameters:
    ///   - change: keyboard frame change representation
    ///   - scrollView: target UIScrollView
    public func handleKeyboardFrameChange(_ change: KeyboardFrameChange, for scrollView: UIScrollView) {
        guard let superview = scrollView.superview else { return }
        let keyboardFrame = superview.convert(change.frame, from: nil)
        var insets = UIEdgeInsets.zero
        let bottomCoverage = scrollView.frame.maxY - keyboardFrame.minY
        if bottomCoverage > 0 {
            insets.bottom = max(bottomCoverage - scrollView.safeAreaInsets.bottom, scrollView.safeAreaInsets.bottom)
        }
        animate(change.animationDuration) {
            scrollView.contentInset = insets
            scrollView.scrollIndicatorInsets = insets
            scrollView.layoutIfNeeded()
        }
    }

    // MARK: Private

    private let animate: Animator

}
