//Created by Lugalu on 10/10/23.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let test = OnboardingCoordinator(root: self)
        test.start()
    
        
        if !UserDefaults.isFirstTime {
            //show Onboarding
        }
    }


}
