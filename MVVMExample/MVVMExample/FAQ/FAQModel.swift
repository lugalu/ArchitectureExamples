//Created by Lugalu on 10/09/23.

import SwiftUI

class FAQEntity{
   
    var title: String
    var message: String
    var content: AnyView?
    
    init(title: String, message: String, content: AnyView? = nil) {
        self.title = title
        self.message = message
        self.content = content
    }
}
//
//
//protocol FAQModelProtocol{
//    var type: FAQType {get}
//    func retrieveData() -> [FAQEntity]
//    func setType(_ type: FAQType)
//    func getTypeTitle() -> String
//}
//
//
//
//class FAQModel: FAQModelProtocol{
// 
//    private var viewType: FAQType = .all
//    
//    var type: FAQType{
//        return viewType
//    }
//
//    func retrieveData() -> [FAQEntity] {
//       
//        var result: [FAQEntity] = []
//        switch type{
//        case .myths:
//            result = [
//                FAQEntity(title: "myth Test", message: "test"),
//                FAQEntity(title: "myth Test", message: "test"),
//                FAQEntity(title: "myth Test", message: "test"),
//                FAQEntity(title: "myth Test", message: "test"),
//                FAQEntity(title: "myth Test", message: "test"),
//            ]
//        case .rules:
//            result = [
//                FAQEntity(title: "rules Test", message: "test"),
//                FAQEntity(title: "rules Test", message: "test"),
//                FAQEntity(title: "rules Test", message: "test"),
//                FAQEntity(title: "rules Test", message: "test"),
//                FAQEntity(title: "rules Test", message: "test"),
//            ]
//        case .benefits:
//            result = [
//                FAQEntity(title: "benefits Test", message: "test"),
//                FAQEntity(title: "benefits Test", message: "test"),
//                FAQEntity(title: "benefits Test", message: "test"),
//                FAQEntity(title: "benefits Test", message: "test"),
//                FAQEntity(title: "benefits Test", message: "test"),
//            ]
//        case .all:
//            result = [
//                FAQEntity(title: "myth screen", message: "test",
//                          content: AnyView( FAQView(viewModel: FAQViewModel(type: .myths)) )
//                         ),
//                FAQEntity(title: "rules screen", message: "test",
//                          content: AnyView( FAQView(viewModel: FAQViewModel(type: .rules)) )
//                         ),
//                FAQEntity(title: "benefits screen", message: "test",
//                          content: AnyView( FAQView(viewModel: FAQViewModel(type: .benefits)) )
//                         )
//            ]
//        }
//        
//        return result
//    }    
//    
//    func setType(_ type: FAQType) {
//        self.viewType = type
//    }
//    
//    func getTypeTitle() -> String {
//        return self.type.rawValue
//    }
//    
//}



