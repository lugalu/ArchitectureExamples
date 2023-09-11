//Created by Lugalu on 10/09/23.

import SwiftUI


protocol FAQViewModelProtocol: ObservableObject {
    func retrieveData()
}

class FAQViewModel: FAQViewModelProtocol {
    
    func retrieveData() {
        print("retrieve!")
    }
}

