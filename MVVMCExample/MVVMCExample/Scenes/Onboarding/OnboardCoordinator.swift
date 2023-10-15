//Created by Lugalu on 13/10/23.

import UIKit

class OnboardingCoordinator: Coordinator{
    
    let root: UIViewController
    
    let rootPageViewController = OnboardingViewController()
    
    lazy var viewModel: OnboardingViewModelProtocol = {
        let vm = OnboardingViewModel(delegate: self)
        return vm
    }()
    
    
    init(root: UIViewController) {
        self.root = root
    }
    
    func start() {
        rootPageViewController.viewModel = viewModel
        rootPageViewController.modalPresentationStyle = .overFullScreen
        root.present(rootPageViewController, animated: true)
    }
    
    func finish() {
        rootPageViewController.dismiss(animated: true)
    }
}


