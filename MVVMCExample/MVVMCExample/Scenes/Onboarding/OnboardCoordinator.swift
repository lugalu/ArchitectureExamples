//Created by Lugalu on 13/10/23.

import UIKit

class OnboardingCoordinator: Coordinator{
    
    
    let root: UIViewController
    
    let rootPageViewController = OnboardingViewController()
    
    let viewModel: OnboardingViewModelProtocol = {
        return OnboardingViewModel()
    }()
    
    
    init(root: UIViewController) {
        self.root = root
    }
    
    func start() {
        rootPageViewController.viewModel = viewModel
        
        root.present(rootPageViewController, animated: true)
    }
    
    func finish() {
        rootPageViewController.dismiss(animated: true)
    }
}


