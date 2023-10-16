//Created by Lugalu on 15/10/23.

import UIKit

protocol ViewProtocol: UIResponder{
    func setup()
    func addViews()
    func configureConstraints()
}

extension ViewProtocol{
    func setup(){
        addViews()
        configureConstraints()
    }
}
