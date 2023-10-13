//Created by Lugalu on 12/10/23.

import UIKit

class OnboardingViewController: UIViewController {
    
    var viewModel: OnboardingViewModelProtocol? = nil


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    
    func setup(){
       let test = CustomButton()
        let action = UIAction(){ _ in
            print("hey ho")
        }
        
        test.setup(title: "Done", actionState: .touchUpInside, action: action)
        
        view.addSubview(test)
        
        test.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            test.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            test.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }   
}
