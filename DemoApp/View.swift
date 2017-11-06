import UIKit

class View: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
