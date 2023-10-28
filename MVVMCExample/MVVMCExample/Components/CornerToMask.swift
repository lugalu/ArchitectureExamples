//Created by Lugalu on 27/10/23.

import UIKit

enum CornerToMask{
    case top
    case bottom
    
    case left
    case topLeft
    case bottomLeft
    
    case right
    case topRight
    case bottomRight
    

    
    func getMask() -> CACornerMask {
        var mask: CACornerMask = []
        
        switch self {
        case .top:
            mask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
        case .left:
            mask = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            
        case .right:
            mask = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
            
        case .topLeft:
            mask = [.layerMinXMinYCorner]
            
        case .bottomLeft:
            mask = [.layerMinXMaxYCorner]
            
        case .topRight:
            mask = [.layerMaxXMinYCorner]
            
        case .bottomRight:
            mask = [.layerMaxXMaxYCorner]
            
        case .bottom:
            mask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        return mask
    }
}
