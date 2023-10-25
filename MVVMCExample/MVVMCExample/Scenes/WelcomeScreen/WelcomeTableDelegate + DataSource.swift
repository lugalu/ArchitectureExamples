//Created by Lugalu on 19/10/23.

import UIKit

final class WelcomeTableController: UIResponder, UITableViewDataSource, UITableViewDelegate {
    let identifier: String = "WelcomeCell"
    let type = WelcomeCell.self
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        let test = cell as! WelcomeCell
        test.configure()
        
        return test
    }
    
    
    
}

class WelcomeCell: UITableViewCell {
    func configure(){
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LORE IPSUM"
        label.textColor = .red
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        self.addSubview(label)
        
        let constraints = [
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}
