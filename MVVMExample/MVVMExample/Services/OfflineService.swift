//Created by Lugalu on 12/09/23.

import Foundation


class OfflineService: DataServiceProtocol{
    func retrieveTips(for type: TipsType) async throws -> [TipEntity] {
        var result: [TipEntity] = []
        
        switch type{
        case .myths:
            result = [
                TipEntity(title: "Menstruating people cannot donate blood", content: """
                **MYTH**
                
                There is no problem with this.
                """),
                
                TipEntity(title: "I can't donate blood because I'm LGBTQIAP+", content: """
                MYTH

                The Supreme Court ruled (2020) that sexual orientation is not part of the clinical screening questionnaire.
                """),
                
                TipEntity(title: "Collected blood can affect health", content: """
                MYTH

                The volume collected does not exceed 10-15%. This volume is naturally replenished by the body within 24 hours of donation.
                """),
                
                TipEntity(title: "Donating blood is addictive/you need to donate all the time", content: """
                MYTH

                It is not addictive in any way. Blood donation is not linked to any kind of addiction.
                """)
                
            ]
        case .rules:
            result = [
                TipEntity(title: "Who can donate blood? Is there a minimum weight?",
                          content: "Who can donate blood? Is there a minimum weight?"),
                
                TipEntity(title: "Do I need to have slept to donate blood?",
                          content: "Yes, at least 6 hours in the last 24 hours."),
                
                TipEntity(title: "What is the maximum frequency for donating?", content: """
                Men: 4 annual blood donations.
                Women: 3 annual blood donations.
                """),
                
                TipEntity(title: "What is the minimum interval for donating blood?", content: """
                Men: every 2 months.
                Women: every 3 months.
                """)
            ]
            
        case .benefits:
            result = [
                TipEntity(title: "Does it have any precedence in the SUS?",
                          content: "Yes, there is a precedence when scheduling exams with SUS."),
                
                TipEntity(title: "Is there priority care by SUS?",
                          content: "Yes, there is priority attendance at medical and dental appointments in SUS hospitals or in units linked to SUS."),
                
                TipEntity(title: "Can I pay half-price for being a donor?", content: """
                It depends! There are municipal and state laws that regulate this benefit for cultural and leisure activities in public and private organizations. Check your local legislation for more information.
                """),
                
                TipEntity(title: "Do I get an exemption from the registration fee?",
                          content: "It depends! Donors can get their registration fees waived, depending on their state and municipality.")
            ]
            
        }
        
        
        return result
        
    }
    
    
}
