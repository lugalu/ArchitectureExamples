//Created by Lugalu on 19/10/23.

import UIKit

final class WelcomeTableController: UIResponder, UITableViewDataSource, UITableViewDelegate {
    let identifier: String = "WelcomeCell"
    let type = WelcomeCell.self
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 10 : 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! WelcomeCell
            var hasViewMore = false
            if indexPath.row == 0 {
                cell.addCorners(.top)
                hasViewMore = true
            }else if indexPath.row == 9 { //TODO: addDataSource
                cell.addCorners(.bottom)
                
            }

            cell.configure(withTitle: "aaaa", withTime: "10:30pm", withImage: "bell.fill", isSystemName: true, hasViewMore: hasViewMore)
            
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier)!
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Reminders" : "Chart"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let customPad = UIView()
        customPad.backgroundColor = .clear
        
        let label = UILabel()
        label.text = self.tableView(tableView, titleForHeaderInSection: section)
        label.textColor = .ultraDarkPink
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        customPad.addSubview(label)
        
        let constraints = [
            label.leadingAnchor.constraint(equalTo: customPad.leadingAnchor, constant: 50),
            label.topAnchor.constraint(equalTo: customPad.topAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        return customPad
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
}
