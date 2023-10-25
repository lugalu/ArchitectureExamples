//Created by Lugalu on 19/10/23.

import UIKit

class LabelCluster: UIView, ViewProtocol {
    
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "10"
        label.font = .systemFont(ofSize: 44, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()

    lazy var rightUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Wed"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rightDownLabel: UILabel = {
        let label = UILabel()
        label.text = "Sep 2021"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configure(leftText: String? = nil, rightUpText: String? = nil, rightDownText: String? = nil) {
        leftLabel.text = leftText
        rightUpLabel.text = rightUpText
        rightDownLabel.text = rightDownText
    }
    
    
    func addViews() {
        self.addSubview(leftLabel)
        self.addSubview(rightUpLabel)
        self.addSubview(rightDownLabel)
    }
    
    func configureConstraints() {
        addLeftLabelConstraints()
        addRightUpLabelConstraints()
        addRightDownLabelConstraints()
    }
    
    private func addLeftLabelConstraints() {
        let constraints = [
            leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leftLabel.topAnchor.constraint(equalTo: self.topAnchor),
            leftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addRightUpLabelConstraints() {
        let constraints = [
            rightUpLabel.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor, constant: 8),
            rightUpLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 11),
            rightUpLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addRightDownLabelConstraints() {
        let constraints = [
            rightDownLabel.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor, constant: 8),
            rightDownLabel.topAnchor.constraint(equalTo: rightUpLabel.bottomAnchor),
            rightDownLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            rightDownLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
    
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
