//Created by Lugalu on 27/10/23.

import UIKit

class WelcomeCell: UITableViewCell {
    let background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .ultraDarkPink
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var viewMore: UIButton = {
        let attributedTitle = NSAttributedString(string: "View More", attributes: [.font: UIFont.systemFont(ofSize: 12, weight: .semibold), .foregroundColor: UIColor.white])
        
        let button = UIButton(configuration: .plain())
        button.tintColor = .white
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    lazy var symbolView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.tintColor = .ultraLightPurple
        return imgView
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .slightPink
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    func configure(withTitle title: String = "", withTime time: String = "", withImage image: String? = nil, isSystemName: Bool = true, hasViewMore: Bool = false, action: UIAction = UIAction(handler: { _ in }), state: UIControl.Event = .touchUpInside ) {
        self.backgroundColor = .clear
        titleLabel.text = title
        timeLabel.text = time
        viewMore.addAction(action, for: state)
        
        
        setup()
        
        if let imageName = image,
        let image = isSystemName ? UIImage(systemName: imageName) : UIImage(named: imageName) {
            symbolView.image = image
        } else {
            symbolView.removeFromSuperview()
        }
        
        if !hasViewMore {
            viewMore.removeFromSuperview()
        }
        
    }
    
    func addCorners(_ corners: CornerToMask) {
        background.layer.cornerRadius = 16
        background.layer.maskedCorners = corners.getMask()
    }
    
}

extension WelcomeCell: ViewProtocol {
    func addViews() {
        self.addSubview(background)
        background.addSubview(titleLabel)
        background.addSubview(viewMore)
        background.addSubview(symbolView)
        background.addSubview(timeLabel)

    }
    
    func configureConstraints() {
        addBackgroundConstraints()
        addTitleLabelConstraints()
        addViewMoreConstraints()
        addSymbolViewConstraints()
        addTimeLabelConstraints()
    }
    
    private func addBackgroundConstraints() {
        let constraints = [
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addTitleLabelConstraints() {
        let constraints = [
            titleLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: background.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 8),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addViewMoreConstraints() {
        let constraints = [
            viewMore.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -20),
            viewMore.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addSymbolViewConstraints() {
        let constraints = [
            symbolView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            symbolView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            symbolView.widthAnchor.constraint(equalToConstant: 18),
            symbolView.heightAnchor.constraint(equalToConstant: 18)

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addTimeLabelConstraints(){
        let constraints = [
            timeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
