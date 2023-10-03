//Created by Lugalu on 10/09/23.

import SwiftUI

struct RoundedBackground<Content: View>: View {
    let color: String
    let ignoresSafeAreaEdges: Edge.Set
    let cornerRadius: CGFloat
    @ViewBuilder let content: () -> Content
    
    init(color: String = "DeepRed", ignoreEdges: Edge.Set = [], cornerRadius: CGFloat = 50, content: @escaping () -> Content = {EmptyView()}) {
        self.color = color
        self.content = content
        self.ignoresSafeAreaEdges = ignoreEdges
        self.cornerRadius = cornerRadius
    }
    
    
    var body: some View {
        Color(color)
            .cornerRadius(cornerRadius)
            .ignoresSafeArea(edges: ignoresSafeAreaEdges)
            .background{
                VStack{
                    HStack{
                        Color.clear
                        
                        Color(color)
                    }
                    HStack{                        
                        Color(color)
                    }
                }
            }
    }
}

struct RoundedBackground_Previews: PreviewProvider {
    static var previews: some View {
        RoundedBackground(color:"DeepRed", content: {Color.black})
    }
}
