//Created by Lugalu on 12/10/23.

import Foundation

protocol OnboardingViewModelProtocol{
    func save(name: String?)
    func close()
}

class OnboardingViewModel: OnboardingViewModelProtocol{
    weak var delegate: Coordinator?
    
    init(delegate: Coordinator? = nil) {
        self.delegate = delegate
    }
    
    func save(name: String?) {
        UserDefaults.username = name ?? "User"
    }
    
    func close() {
        self.delegate?.finish()
    }
    
}
