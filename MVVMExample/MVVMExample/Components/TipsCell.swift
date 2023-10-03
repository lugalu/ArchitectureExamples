//Created by Lugalu on 02/10/23.

import SwiftUI

struct TipsCell: View {
    var title: String
    var message: AttributedString
    var nextView: AnyView? = nil
    
    var body: some View {
        makeCell()
    }
    
    @ViewBuilder func makeCell() -> some View{
        let view =
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 319, height: 137)
            .foregroundColor(Color("LightPink"))
            .overlay(alignment: .topLeading){
                VStack(alignment: .center, spacing: 16){
                    Group{
                        Text(title)
                            .font(.system(size: 20, weight: .bold))
                        
                        Text(message)
                            .font(.system(size: 10, weight: .bold))
                            .lineLimit(2)
                            .padding(.all, 5)
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                            .padding(.trailing,98)
                            .multilineTextAlignment(.center)
                            //.lineLimit(nil)
                    }
                    .foregroundColor(Color("TabBarBlue"))
                    .multilineTextAlignment(.leading)
                }
                .padding(.leading, 22)
                .padding(.top, 25)
                
            }
            .overlay(alignment: .topTrailing){
                Rectangle()
                    .foregroundColor(Color("LightPink"))
                    .frame(width: 30, height: 30)
            }
        
        if let content = nextView {
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
