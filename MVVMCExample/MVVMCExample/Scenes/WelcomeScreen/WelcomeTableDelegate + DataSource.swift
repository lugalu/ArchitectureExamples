//Created by Lugalu on 19/10/23.

import UIKit

final class WelcomeTableController: UIResponder, UITableViewDataSource, UITableViewDelegate {
    let identifier: String = "WelcomeCell"
    let type = WelcomeCell.self
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            let test = cell as! WelcomeCell
            

            test.configure()
            
            return test
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier)!
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Reminders" : "Chart"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = self.tableView(tableView, titleForHeaderInSection: section)
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.insetsLayoutMarginsFromSafeArea = true
        return label
    }
 
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return 50
    }
}

class WelcomeCell: UITableViewCell, ViewProtocol {
    let background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .ultraDarkPink
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var viewMore: UIButton = {
        let button = UIButton(configuration: .plain())
        button.tintColor = .white
        button.setTitle("View More", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    lazy var symbolView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    func configure(withTitle title: String = "", withTime time: String = "", withImage image: String? = nil, isSystemName: Bool = true, hasViewMore: Bool = false){
        self.backgroundColor = .clear
        titleLabel.text = time
        timeLabel.text = time
        
        setup()
        
        if let imageName = image,
        let image = isSystemName ? UIImage(systemName: imageName) : UIImage(named: imageName) {
            symbolView.image = image
        } else {
            symbolView.removeFromSuperview()
        }
        
        if !hasViewMore {
            viewMore.removeFromSuperview()
        }
        
    }
    
    func addViews() {
        self.addSubview(background)
        background.addSubview(titleLabel)
        background.addSubview(viewMore)
        background.addSubview(symbolView)
        background.addSubview(timeLabel)

    }
    
    func configureConstraints() {
        
    }
    
}
