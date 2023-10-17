//Created by Lugalu on 17/10/23.

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        #if DEBUG
        if ProcessInfo.processInfo.environment["OverwriteFirstTime"] == "True" {
            let onboarding = OnboardingCoordinator(root: self)
            onboarding.start()
            NotificationCenter.default.addObserver(self, selector: #selector(updateFromOnboarding), name: .didReturnFromOnboarding, object: nil)
        }
        
        #else

        if !UserDefaults.isFirstTime {
            let onboarding = OnboardingCoordinator(root: self)
            onboarding.start()
            NotificationCenter.default.addObserver(self, selector: #selector(updateFromOnboarding), name: .didReturnFromOnboarding, object: nil)
        }
        
        #endif
    }
    
    @objc
    func updateFromOnboarding(){
        NotificationCenter.default.removeObserver(self, name: .didReturnFromOnboarding, object: nil)
        //TODO: UPDATE NAME LABEL
        print("Hey Ho")
    }
}

extension WelcomeViewController: ViewProtocol{
    func addViews() {
        
    }
    
    func configureConstraints() {
        
    }
    
    
}
