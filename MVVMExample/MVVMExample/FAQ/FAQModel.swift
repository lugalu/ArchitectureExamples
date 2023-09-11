//Created by Lugalu on 10/09/23.

import SwiftUI



protocol FAQModelProtocol{
    //func retrieveDataFor(tips: )
}



class FAQModel: FAQModelProtocol{
    enum FAQType{
        case myths
        case rules
        case benefits
        case all
    }
    
    class FAQEntity<Content: View>{
        var title: String
        var message: String
        var content: (() -> Content)?
        
        init(title: String, message: String, content: (() -> Content)? = nil) {
            self.title = title
            self.message = message
            self.content = content
        }
        
    }
    
    
}



