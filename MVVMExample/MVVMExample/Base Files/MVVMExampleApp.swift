//Created by Lugalu on 03/09/23.

import SwiftUI

@main
struct MVVMExampleApp: App {
    @AppStorage("isFirstTime") var isFirstTime = true
    @AppStorage("isShowingAchievement") var isShowingAchievement = false
    
    var body: some Scene {
        WindowGroup {
            TabView{
                OverviewView(viewModel: OverViewViewModel())
                    .tabItem{
                        Label("Overview", systemImage: "heart.fill")
                    }
                    .toolbarBackground( Color("TabBarBlue"), for: .automatic)
                    
            }
            .tint(Color("TabBarTint"))
            .sheet(isPresented: $isFirstTime){
                Text("HeyHo")
            }
            .sheet(isPresented: $isShowingAchievement){
                Text("HeyHo")
            }            
        }
    }
}
