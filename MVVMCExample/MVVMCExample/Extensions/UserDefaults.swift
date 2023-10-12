//Created by Lugalu on 12/10/23.

import Foundation


extension UserDefaults{
    static var isFirstTime: Bool{
        get{
            return UserDefaults.standard.bool(forKey: "isFirstTime")
        }
        
        set{
            UserDefaults.standard.set(newValue, forKey: "isFirstTime")
        }
    }
}
