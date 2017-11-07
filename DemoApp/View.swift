import UIKit

class View: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        configureSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    let scrollView = UIScrollView(frame: .zero)
    let textView = UITextView(frame: .zero)

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(textView)
    }

    private func configureSubviews() {
        scrollView.alwaysBounceVertical = true
        scrollView.keyboardDismissMode = .interactive

        textView.isScrollEnabled = false
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.borderWidth = 0.5
        textView.text = """
            Lorem ipsum dolor sit amet mauris magna, gravida sem. Quisque augue. Maecenas nisl risus, euismod mi. Aliquam erat eu lobortis dapibus, accumsan lorem. Sed congue, lacus sagittis odio adipiscing dolor vel molestie venenatis nulla.

            Put your text here...
            """
    }

    // MARK: Layout

    private func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
        textView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
        textView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16).isActive = true
        textView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16).isActive = true
        textView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16).isActive = true
    }

}
