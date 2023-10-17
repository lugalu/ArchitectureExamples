//Created by Lugalu on 13/10/23.

import UIKit

class OnboardingCoordinator: Coordinator{
    
    let root: UIViewController
    
    let rootPageViewController = OnboardingViewController()
    
    let modalViewController: ModalViewController = {
        let modal = ModalViewController()
        modal.modalPresentationStyle = .automatic
        return modal
    }()
    
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
        root.present(rootPageViewController, animated: true){
            self.rootPageViewController.present(self.modalViewController, animated: true)
        }
        
    }
    
    func finish() {
        UserDefaults.isFirstTime = true
        rootPageViewController.dismiss(animated: true){
            NotificationCenter.default.post(name: .didReturnFromOnboarding, object: nil)
        }
    }
}


