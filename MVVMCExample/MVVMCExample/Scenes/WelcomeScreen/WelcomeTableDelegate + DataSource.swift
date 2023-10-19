//Created by Lugalu on 19/10/23.

import UIKit

final class WelcomeTableController: NSObject, UITableViewDataSource, UITableViewDelegate {
    let identifier: String = "WelcomeCell"
    let type = WelcomeCell.self
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

class WelcomeCell: UITableViewCell {
    
}
