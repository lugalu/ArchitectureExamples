//Created by Lugalu on 12/10/23.

import UIKit

class AppCoordinator: Coordinator{
    
    let window: UIWindow?
    
    lazy var root: UINavigationController = UINavigationController(rootViewController: WelcomeViewController())
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    convenience init(window: UIWindow?, navigationViewController: UINavigationController){
        self.init(window: window)
        self.root = navigationViewController
    }
    
    func start() {
        guard let window else {
            return
        }
        
        window.rootViewController = root
        window.makeKeyAndVisible()
        
    }
    
    func finish() {
        
    }
    
}


