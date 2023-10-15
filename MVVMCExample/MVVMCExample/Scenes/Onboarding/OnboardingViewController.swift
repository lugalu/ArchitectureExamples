//Created by Lugalu on 12/10/23.

import UIKit

class OnboardingViewController: UIViewController, ViewProtocol {
    
    var viewModel: OnboardingViewModelProtocol? = nil
    
    lazy var headline: UILabel = {
        let label = UILabel()
        
        label.text = "Hello, before we begin we would like to know you!"
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        
        label.text = "What you would like to be called?"
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameTextfield: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 9
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.25
        
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "User"
        textfield.delegate = self
        
        view.addSubview(textfield)
        
        let constraints = [
            textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textfield.topAnchor.constraint(equalTo: view.topAnchor),
            textfield.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        return view
    }()
    
    
    lazy var doneButton: CustomButton = { [weak self] in
        let button = CustomButton()
        
        let action = UIAction(){ _ in
            self?.viewModel?.close()
        }
        
        button.setup(title: "Done", actionState: .touchUpInside, action: action)
        
        return button
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    func setup(){
        applySystemBackground()
        addViews()
        configureConstraints()
    }
    
}

extension OnboardingViewController: UITextFieldDelegate{
    //TODO: implement this!
}


extension OnboardingViewController{
    
    func addViews(){
        view.addSubview(headline)
        view.addSubview(subtitle)
        view.addSubview(nameTextfield)
        view.addSubview(doneButton)

    }
    
    func configureConstraints() {
        addHeadlineConstraints()
        addSubtitleConstraints()
        addNameTextfieldConstraints()
        addDoneButtonConstraints()
        
    }
    
    private func addHeadlineConstraints(){
        let constraints = [
            headline.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96),
            headline.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 49),
            headline.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -49)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addSubtitleConstraints(){
        let constraints = [
            subtitle.topAnchor.constraint(equalTo: headline.bottomAnchor, constant: 44),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addNameTextfieldConstraints(){
        let constraints = [
            nameTextfield.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 44),
            nameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nameTextfield.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func addDoneButtonConstraints(){
        let constraints = [
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -96),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ]
        NSLayoutConstraint.activate(constraints)
    }    
}



