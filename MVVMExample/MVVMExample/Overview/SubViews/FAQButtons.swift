//Created by Lugalu on 07/09/23.

import SwiftUI

struct FAQButton<Content: View>: View{
    let imageName: String
    let isSystemImage: Bool
    let text: String
    @ViewBuilder let destination: () -> Content
    var hasPadding: Bool{
        return text.count > 8
    }

    
    var body: some View{
        NavigationLink(destination: destination, label: {
            RoundedRectangle(cornerRadius: 233)
                .fill(Color("LightRed"))
                .overlay(alignment: .top){
                    VStack(spacing: 8){
                        Circle()
                            .frame(width: 66, height: 66)
                            .foregroundColor(.white)
                            .overlay{
                                Group{
                                    if isSystemImage{
                                        Image(systemName: imageName)
                                    }else{
                                        Image(imageName)
                                    }
                                }
                                .font(.system(size: 25))
                                .foregroundColor(Color("TabBarBlue"))
                            }
                            
                            Text(text)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color("TabBarBlue"))
                                .padding(.bottom,13)
                                .padding(.top, !hasPadding ? 8 : 0)

                        
                    }
                    .padding([.top,.horizontal], 14)
                }
        })
    }
}
