//Created by Lugalu on 12/09/23.

import Foundation
import SwiftUI

protocol TipsModelProtocol{
    var type: TipsType { get }
    
    func retrieveTips() async -> [TipEntity]
    func setType(_ type: TipsType)
}

enum TipsType: String{
    case myths = "Myths"
    case rules = "Rules"
    case benefits = "Benefits"
    
    func getTitle() -> String{
        switch self {
        case .myths:
            return "Myth Or Truth?"
            
        case .rules:
            return "Donation Rules"
            
        case .benefits:
            return "Real Benefits For Donors"
        }
    }
    
    func getSubTitle() -> String{
        switch self {
        case .myths:
            return "Discover The Main Questions z\nAnd Stay Informed"
            
        case .rules:
            return "Learn The Requirements For \nBlood Donations"
            
        case .benefits:
            return "Find Out What Are The Bonuses \nFor Donating Blood"
        }
    }
    
    func getSources() -> LocalizedStringKey {
        switch self {
        case .myths:
            return "All Information Was Sourced \nFrom The Brazilian [Ministry Of Health](https://www.gov.br/saude/pt-br/composicao/saes/sangue/mitos-e-verdades-sobre-a-doacao-de-sangue) Website"
            
        case .rules:
            return "All Information Was Sourced \nFrom The Brazilian [Ministry Of Health](https://www.gov.br/saude/pt-br/composicao/saes/sangue) Website"
            
        case .benefits:
            return  """
                    All Information Was Sourced \nFrom [HemoMinas](http://www.hemominas.mg.gov.br/duvidas/64-doacao-de-sangue/654-direitos-dos-doadores-de-sangue-legislacao?utm_source=blog&utm_campaign=rc_blogpost#quais-os-direitos-do-doador-de-sangue) and [Ceon+](https://oncologiaabc.com.br/os-beneficios-para-o-doador-de-sangue-no-brasil)
                    """
        }
    }
    
}

struct TipEntity: Decodable {
    let title: String
    let content: AttributedString
    
    init(title: String, content: String) {
        self.title = title
        self.content = (try? AttributedString(markdown: content, options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace))) ?? AttributedString(content)
    }
}

class TipsModel: TipsModelProtocol{
    private(set) var type: TipsType
    
    init(type: TipsType) {
        self.type = type
    }
    
    func retrieveTips() async -> [TipEntity] {
        do{
            guard let result = try await ServiceLocator.serviceLocator.retriveDataService()?.retrieveTips(for: self.type) else {
                return []
            }
            
            return result
        }catch{
            return []
        }
        
    }
    
    func setType(_ type: TipsType) {
        self.type = type
    }
    
}
