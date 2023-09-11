//Created by Lugalu on 03/09/23.

import SwiftUI

struct OverviewView<ViewModel>: View where ViewModel: OverViewViewModelProtocol{
    @ObservedObject var viewModel: ViewModel
       
    init(viewModel: ViewModel = OverViewViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
            
        VStack(alignment: .leading){
            userSection()
                .background{
                    smallBackground()
                }
      
            
            ZStack{
                RoundedBackground(ignoreEdges: [.horizontal,.bottom])
                
                VStack(alignment: .leading, spacing: 32){
                    makeRegisterSection()
                    
                    makeFAQSection()

                    makeAchievementsSection()

                }
                .padding(.horizontal, 30)
            }
            .ignoresSafeArea(edges: [.horizontal])
            .coordinateSpace(name: "Corner")
            
        }
        .tint(.accentColor)
        
    }
    
    
    func userSection() -> some View{
        HStack{
            VStack(alignment: .leading, spacing: 4){
                Group{
                    Text("Hello, \(viewModel.username)")
                        .font(.system(size: 40,weight: .bold,design: .rounded))
                    
                    Text("You haven't registered any donations,\n what about doing it now?")
                        .font(.system(size: 12))
                }
                .foregroundColor(Color("TabBarBlue"))
            }
            
            
            Spacer()
            
            Image("Lenna")
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
        }
        .padding(.bottom, 16)
        .padding(.top, 45)
        .padding(.horizontal, 30)
    }
    
    func smallBackground() -> some View{
        GeometryReader{ proxy in
            HStack{
                Color.clear
                Color("DeepRed")
                    .position(x:proxy.frame(in: CoordinateSpace.named("Corner")).midX, y:proxy.frame(in: CoordinateSpace.named("Corner")).midY)
            }
            HStack{
                    Ellipse()
                    .fill(.white)
                    .frame(height: 175)
                    .offset(x: 50, y: -20)
            }
        }
    }
    
    func makeRegisterSection() -> some View{
        VStack(alignment: .leading){
            Text("Register")
                .sectionText()
            
            NavigationLink(destination: {
                Text("") //TODO: add destination
            }) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 102)
                    .foregroundColor(Color("RegisterGreen"))
                    .overlay{
                        HStack(spacing: 21){
                            Text(try! AttributedString(markdown: "Make your **first** register about your donation!"))
                                .font(.system(size: 18, design: .rounded))
                                .foregroundColor(Color("TabBarBlue"))
                                .multilineTextAlignment(.leading)
                            
                            Image(systemName: "drop")
                                .resizable()
                                .frame(width: 40, height: 60)
                                .foregroundColor(Color("DeepRed"))
                            
                            Image(systemName: "chevron.right")
                                .padding(.bottom, 40)
                                .foregroundColor(Color("TabBarBlue"))
                        }
                        .padding(.horizontal, 20)
                        
                    }
            }

        }
    }
    
    func makeFAQSection() -> some View{
        VStack(alignment: .leading){
            HStack(alignment: .bottom, spacing: 212){
                Text("FAQ")
                    .sectionText()
                
                NavigationLink(destination: Color.black, label: {
                    Text("See more")
                        .font(.system(size: 12))
                        .foregroundColor(Color("RegisterPink"))
                })
            }
            
            HStack(spacing: 30){
                Group{
                    FAQButton(imageName: "theatermasks.fill",isSystemImage: true, text: "Myths or\n Truths") {
                        Text("")
                    }
                    
                    FAQButton(imageName: "text.bubble.fill",isSystemImage: true, text: "Rules") {
                        Text("")
                    }
                    
                    FAQButton(imageName: "crown.fill",isSystemImage: true, text: "Benefits") {
                        Text("")
                    }
                }
                
            }
            .frame(height: 136)
        }
    }

    
    func makeAchievementsSection() -> some View{
        VStack(alignment: .leading){
            Text("Achievements")
                .sectionText()
            
            NavigationLink(destination: EmptyView()){
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("LightPink"))
                    .frame(height: 58)
                    .overlay(alignment: .leading){
                        HStack{
                            Group{
                                Image(systemName: "sparkles")
                                    .font(.system(size: 25))
                                
                                Text("Discover and win medals")
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                                .foregroundColor(Color("TabBarBlue"))
                        }
                        .padding(.horizontal, 20)
                    }
            }
        }
    }
    
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        OverviewView()
//    }
//}

extension Text{
    func sectionText() -> some View{
        self
            .font(.system(size: 25,weight: .bold,design: .default))
            .foregroundColor(Color("RegisterPink"))
    }
}
