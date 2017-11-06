import UIKit
import KeyboardFrameChangeListener

/// Adjusts insets of UIScrollView so the keyboard does not cover content
public protocol ScrollViewKeyboardAvoiding {

    /// Handle keyboard frame change
    ///
    /// - Parameters:
    ///   - change: keyboard frame change representation
    ///   - scrollView: target UIScrollView
    func handleKeyboardFrameChange(_ change: KeyboardFrameChange, for scrollView: UIScrollView)

}
