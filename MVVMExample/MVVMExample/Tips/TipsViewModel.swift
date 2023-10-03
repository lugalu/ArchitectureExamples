//Created by Lugalu on 12/09/23.

import SwiftUI

protocol TipsViewModelProtocol: ObservableObject{
    var tips: [TipEntity] {get}
    var type: TipsType {get}
    
    func getTips()
}

class TipsViewModel: TipsViewModelProtocol{
    
    @Published private(set) var tips: [TipEntity] = []
    @Published private(set) var type: TipsType
    
    var model: TipsModelProtocol
    
    init(type: TipsType) {
        self.model = TipsModel(type: type)
        self.type = model.type
        
        self.getTips()
    }
    
    func getTips(){
        Task{
            let result = await model.retrieveTips()
            DispatchQueue.main.async {
                self.tips = result
            }
        }
    }
}



