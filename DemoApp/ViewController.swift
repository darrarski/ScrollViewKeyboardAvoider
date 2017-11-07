import UIKit
import KeyboardFrameChangeListener
import ScrollViewKeyboardAvoider

class ViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: View

    override func loadView() {
        view = View()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listener.keyboardFrameWillChange = { [unowned self] in
            self.avoider.handleKeyboardFrameChange($0.frame,
                                                   animationDuration: $0.animationDuration,
                                                   for: (self.view as! View).scrollView)
        }
    }

    // MARK: Private

    private let listener: KeyboardFrameChangeListening = KeyboardFrameChangeListener(
        notificationCenter: NotificationCenter.default
    )

    private let avoider: ScrollViewKeyboardAvoiding = ScrollViewKeyboardAvoider(
        animator: { UIView.animate(withDuration: $0, animations: $1) }
    )

}
