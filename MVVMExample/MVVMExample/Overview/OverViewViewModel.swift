//Created by Lugalu on 04/09/23.

import SwiftUI

protocol OverViewViewModelProtocol: ObservableObject{
    var username: String {get set}
}

class OverViewViewModel: OverViewViewModelProtocol{
    
    @AppStorage("Name") var username = "Donor"
    
    
    
}
