//Created by Lugalu on 17/10/23.

import UIKit

protocol WelcomeViewModelProtocol {
    var tableController: UITableViewDataSource & UITableViewDelegate { get }
    var scrollViewDelegate: UIScrollViewDelegate { get }
    
    func getCellIdentifer() -> String
    func getCellType() -> UITableViewCell.Type
}


class WelcomeViewModel: WelcomeViewModelProtocol {
    lazy var welcomeTableController: WelcomeTableController = WelcomeTableController()
    lazy var welcomeScrollViewDelegate: WelcomeScrollViewDelegate = WelcomeScrollViewDelegate()
    
    var tableController: UITableViewDataSource & UITableViewDelegate {
        return welcomeTableController
    }
    
    var scrollViewDelegate: UIScrollViewDelegate {
        return welcomeScrollViewDelegate
    }
    
    func getCellIdentifer() -> String {
        return welcomeTableController.identifier
    }
    
    func getCellType() -> UITableViewCell.Type {
        return welcomeTableController.type
    }
    
}


final class WelcomeScrollViewDelegate: NSObject, UIScrollViewDelegate {
    
}

