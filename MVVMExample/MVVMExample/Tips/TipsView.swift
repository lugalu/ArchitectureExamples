//Created by Lugalu on 12/09/23.

import SwiftUI

struct TipsView<ViewModel: TipsViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
        
    var body: some View {
        ScrollView {
            HStack{ Spacer() }
            Group {
                Text("\(viewModel.type.getTitle())")
                    .font(.system(.largeTitle,weight: .bold))
                    .foregroundColor(Color("TabBarBlue"))
                
                Text("\(viewModel.type.getSubTitle())")
                    .font(.system(.body,weight: .medium))
                    .foregroundColor(Color("TabBarBlue"))
                
                Text(viewModel.type.getSources())
                    .font(.system(.caption))
            }
            .padding(.horizontal,32)
            
            ZStack(alignment: .bottom) {
                RoundedBackground(ignoreEdges: [.horizontal,.bottom])
                    .frame(minHeight: 0, maxHeight: .infinity)
                    
                VStack(alignment: .trailing) {
                    ForEach(viewModel.tips, id: \.title) { tip in
                        TipsCell(title: tip.title, message: tip.content,nextView: nil)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.top, 10)
                }
                .edgesIgnoringSafeArea([.horizontal,.bottom])
                .padding(.bottom, 50)
                
                
            }
        }
        .background(){
            VStack{
                Spacer()
                    .frame(height: 300)
                Color("DeepRed")
                    .edgesIgnoringSafeArea([.horizontal,.bottom])
                    
            }
        }
    }
}
