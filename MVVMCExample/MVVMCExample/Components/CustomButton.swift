//Created by Lugalu on 13/10/23.

import UIKit

class CustomButton: UIButton {
    func setup(title:String,
               for state: UIControl.State = .normal,
               color: UIColor? = .ultraPink,
               labelColor: UIColor? = .darkPurple,
               actionState: UIControl.Event,action: UIAction) {
        
      
        
        self.configuration = .bordered()
        self.configuration?.buttonSize = .large
        self.configuration?.cornerStyle = .medium
        self.configuration?.titleAlignment = .center
        self.configuration?.baseBackgroundColor = color
        
        self.setTitle(title, for: state)
        self.setTitleColor(labelColor, for: state)
        
        let attributedTitle = NSAttributedString(string: title,
                                                 attributes: [.foregroundColor: labelColor ?? .black,
                                                              .font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
        )
        
        self.setAttributedTitle(attributedTitle, for: state)
        
        self.addAction(action, for: actionState)
        
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 11)
        self.layer.shadowOpacity = 0.25
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
