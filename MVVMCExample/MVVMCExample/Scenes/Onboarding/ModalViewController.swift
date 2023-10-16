//Created by Lugalu on 16/10/23.

import UIKit

class ModalViewController: UIViewController, ViewProtocol {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.textColor = .label
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var nightRoutineLabel: CustomLabel = {
        let label = CustomLabel(image: "clock.badge",
                                isSystemImage: true,
                                title: "Track how your nightly routine is going",
                                subtitle: "Take notes of your daily activities and keep up with your progress.")
        return label
    }()
    
    private lazy var suggestionsLabel: CustomLabel = {
        let label = CustomLabel(image: "bell.badge.fill",
                                isSystemImage: true,
                                title: "Receive suggestions",
                                subtitle: "Add and edit suggestions according to your routine.")
        return label
    }()
    
    private lazy var viewLabel: CustomLabel = {
        let label = CustomLabel(image: "rectangle.and.pencil.and.ellipsis",
                                isSystemImage: true,
                                title: "View your activities on a graph",
                                subtitle: "Track your progress from month to month to understand your nightly routine.")
        return label
    }()
    
    lazy var doneButton: CustomButton = {
        let button = CustomButton()
        let action = UIAction(){ _ in
            self.dismiss(animated: true)
        }
        
        button.setup(title: "Next", actionState: .touchUpInside, action: action)
        
        return button
    }()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    func setup() {
        addViews()
        configureConstraints()
        
        self.applySystemBackground()
        
        nightRoutineLabel.changeTint(newColor: UIColor.iconPink!)
        suggestionsLabel.changeTint(newColor: UIColor.iconPink!)
        viewLabel.changeTint(newColor: UIColor.iconPink!)
    }
    
    func addViews() {
        view.addSubview(titleLabel)
        view.addSubview(nightRoutineLabel)
        view.addSubview(suggestionsLabel)
        view.addSubview(viewLabel)
        view.addSubview(doneButton)
    }
    
    func configureConstraints() {
        addTitleConstraints()
        addNightConstraints()
        addSuggestionConstraints()
        addViewConstraints()
        addDoneButtonConstraints()
    }
    
    private func addTitleConstraints(){
        let constraints = [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addNightConstraints(){
        let constraints = [
            nightRoutineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nightRoutineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 64),
            nightRoutineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nightRoutineLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    private func addSuggestionConstraints(){
        let constraints = [
            suggestionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            suggestionsLabel.topAnchor.constraint(equalTo: nightRoutineLabel.bottomAnchor, constant: 42),
            suggestionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            suggestionsLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addViewConstraints(){
        let constraints = [
            viewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            viewLabel.topAnchor.constraint(equalTo: suggestionsLabel.bottomAnchor, constant: 42),
            viewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            viewLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addDoneButtonConstraints(){
        let constraints = [
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -96)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}

fileprivate class CustomLabel: UIView, ViewProtocol {
 
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    init(image: String, isSystemImage: Bool = false, title: String, subtitle: String) {
        let image = (isSystemImage ? UIImage(systemName: image) : UIImage(named: image)) ?? UIImage(systemName: "pencil")!
        
        self.imageView.image = image
        
        
        self.title.text = title
        self.subtitle.text = subtitle
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func changeTint(newColor: UIColor){
        imageView.tintColor = newColor
    }
    
    func addViews(){
        self.addSubview(imageView)
        self.addSubview(title)
        self.addSubview(subtitle)
    }
    
    func configureConstraints() {
        addImageConstraints()
        addTitleConstraints()
        addSubtitleConstraints()
    }
    
    func addImageConstraints(){
        let constraints = [
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
          //  imageView.topAnchor.constraint(equalTo: self.topAnchor),
          //  imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 47),
            imageView.heightAnchor.constraint(equalToConstant: 38)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func addTitleConstraints(){
        let constraints = [
            title.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func addSubtitleConstraints(){
        let constraints = [
            subtitle.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            subtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor),
            subtitle.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
