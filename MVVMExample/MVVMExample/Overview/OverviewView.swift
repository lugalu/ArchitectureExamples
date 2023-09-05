//Created by Lugalu on 03/09/23.

import SwiftUI

struct OverviewView<ViewModel>: View where ViewModel: OverViewViewModelProtocol{
    @ObservedObject var viewModel: ViewModel
       
    var body: some View {
        ZStack(alignment: .bottom){

                Color("DeepRed")
                    .cornerRadius(30)
                    .ignoresSafeArea()
            
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading, spacing: 4){
                        Text("Hello, \(viewModel.username)")
                        Text("Some text")
                    }
                    
                    Spacer()
                    
                    Image("Lenna")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                }
                .padding(.bottom, 124)
                
                makeRegisterSection()
                
                HStack(spacing: 212){
                    Text("FAQ")
                    
                    Text("See more")
                }
                
                HStack(spacing: 30){
                    RoundedRectangle(cornerRadius: 233)
                    RoundedRectangle(cornerRadius: 233)
                    RoundedRectangle(cornerRadius: 233)
                }
                .frame(height: 136)
                
                Text("Achievements")
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 58)
                    
                
            }
            .padding(.horizontal, 30)

        }
        
    }
    
    func makeRegisterSection() -> some View{
        Group{
            Text("Register")
                .font(.system(size: 25))
                .foregroundColor(Color("RegisterPink"))
            
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 102)
                .foregroundColor(Color("RegisterGreen"))
                .overlay{
                    HStack(spacing: 21){
                        Text(try! AttributedString(markdown: "Faça o seu **primeiro** registro avisando sobre a sua doação!"))
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(Color("TabBarBlue"))
                        
                        Image(systemName: "drop.fill")
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
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        OverviewView()
//    }
//}
