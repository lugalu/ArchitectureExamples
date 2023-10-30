//Created by Lugalu on 17/10/23.

import Foundation

protocol WelcomeModelProtocol{
    func getCellData()
}



class WelcomeModel: WelcomeModelProtocol{
    func getCellData() {
        print("Ayooo")
    }
}
