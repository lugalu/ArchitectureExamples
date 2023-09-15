//Created by Lugalu on 12/09/23.

import Foundation

protocol TipsModelProtocol{
    var type: TipsType { get }
    
    func retrieveTips() async -> [TipEntity]
    func setType(_ type: TipsType)
}

enum TipsType: String{
    case myths = "Myths"
    case rules = "Rules"
    case benefits = "Benefits"
    
    func getHeader() -> (title: String, subTitle: String, source: String){
        switch self {
        case .myths:
            return (title: "Myth Or Truth?",
                    subTitle: "Discover The Main Questions And Stay Informed",
                    source: "All Information Was Sourced From The Brazilian (Ministry Of Health)[https://www.gov.br/saude/pt-br/composicao/saes/sangue/mitos-e-verdades-sobre-a-doacao-de-sangue] Website")
            
        case .rules:
            return (title: "Donation Rules",
                    subTitle: "Learn The Requirements For Blood Donations",
                    source: "All Information Was Sourced From The Brazilian (Ministry Of Health)[https://www.gov.br/saude/pt-br/composicao/saes/sangue] Website")
            
        case .benefits:
            return (title: "Real Benefits For Donors",
                    subTitle: "Find Out What Are The Bonuses For Donating Blood",
                    source: """
                    All Information Was Sourced From (HemoMinas)[http://www.hemominas.mg.gov.br/duvidas/64-doacao-de-sangue/654-direitos-dos-doadores-de-sangue-legislacao?utm_source=blog&utm_campaign=rc_blogpost#quais-os-direitos-do-doador-de-sangue] and (Ceon+)[https://oncologiaabc.com.br/os-beneficios-para-o-doador-de-sangue-no-brasil]
                    """)
        }
    }
}

struct TipEntity: Decodable {
    let title: String
    let content: String
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
