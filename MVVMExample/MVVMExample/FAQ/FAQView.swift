//Created by Lugalu on 10/09/23.

import SwiftUI

struct FAQView<ViewModel>: View where ViewModel: FAQViewModelProtocol {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    
    init(_ viewModel: ViewModel = FAQViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 25){
            makeBackground()
            
            ForEach(viewModel.retriveCardsContent(), id: \.title){ card in
                makeCell(withData: card)
            }
            
            Spacer()
            
        }
        .navigationTitle("FAQ")
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button {
                    dismiss()
                    
                } label: {
                    HStack {
                        Image(systemName: "arrow.backward")
                        Text("Overview")
                    }
                }
                
            }
        }
    }
    
    func makeBackground() -> some View{
        ZStack(alignment: .topLeading){
            Color("DeepRed")
                .cornerRadius(50)
            
            HStack{
                Color("DeepRed")
                Color.clear
            }
            VStack{
                Color("DeepRed")
                Color.clear
            }
            
            VStack(alignment: .leading, spacing: 10){
                Group{
                    Text("Questions About Blood Donation")
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 30,weight: .bold))
                        .padding(.top, 21)
                    
                    Text("Check the recommendations and resolve your uncertanties")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 16))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(Color("RegisterPink"))
                .padding(.horizontal, 32)
            }
        }
    }
    
    @ViewBuilder func makeCell(withData data: FAQEntity) -> some View{
        let view =
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 319, height: 137)
            .foregroundColor(Color("LightPink"))
            .overlay(alignment: .topLeading){
                VStack(alignment: .leading, spacing: 16){
                    Group{
                        Text(data.title)
                            .font(.system(size: 20, weight: .bold))
                        
                        Text(data.message)
                            .font(.system(size: 10, weight: .bold))
                            .lineLimit(2)
                            .padding(.all, 5)
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                            .padding(.trailing,98)
                    }
                    .foregroundColor(Color("TabBarBlue"))
                    .multilineTextAlignment(.leading)
                }
                .padding(.leading, 22)
                .padding(.top, 25)
                
            }
        
        if let content = data.content {
            let navigation =
            NavigationLink(destination: content, label: {
              view
            })
            navigation
            
        }else{
            view
        }

    }
}
