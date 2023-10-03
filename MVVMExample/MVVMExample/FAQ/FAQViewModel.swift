//Created by Lugalu on 10/09/23.

import SwiftUI




protocol FAQViewModelProtocol: ObservableObject {
    func retriveCardsContent() -> [FAQEntity]
}

class FAQViewModel: FAQViewModelProtocol {
    func retriveCardsContent() -> [FAQEntity] {
        return [
            FAQEntity(title: "Myths Or Truth: Is Donating Blood Addictive?",
                      message: "Learn all about the myths and truths that haunt blood donation",
                      content: AnyView(TipsView(viewModel: TipsViewModel(type: .myths))) ),
            
            FAQEntity(title: "Rules: what you need to bring documentation?",
                      message: "Learn all about the requirements for blood donation",
                     content: AnyView(TipsView(viewModel: TipsViewModel(type: .rules))) ),
            
            FAQEntity(title: "Benefits: are there real bonuses?",
                      message: "Find out all about the bonuses for blood donors",
                     content: AnyView(TipsView(viewModel: TipsViewModel(type: .benefits))) )
        ]
    }
    
}
