//Created by Lugalu on 12/09/23.

import Foundation


class OfflineService: DataServiceProtocol{
    func retrieveTips(for type: TipsType) async throws -> [TipEntity] {
        var result: [TipEntity] = []
        
        switch type{
        case .myths:
            result = [
                TipEntity(),
                TipEntity()
            ]
        case .rules:
            result = [
                TipEntity(),
                TipEntity()
            ]
            
        case .benefits:
            result = [
                TipEntity(),
                TipEntity()
            ]
            
        }
        
        
        return result
        
    }
    
    
}
