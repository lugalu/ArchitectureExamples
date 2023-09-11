//Created by Lugalu on 03/09/23.

import SwiftUI

@main
struct MVVMExampleApp: App {
    @AppStorage("isFirstTime") var isFirstTime = true
    @AppStorage("isShowingAchievement") var isShowingAchievement = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "TabBarBlue")
 
   }
    
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationStack {
                    OverviewView()
                }
                .tabItem{
                    Label("Overview", systemImage: "heart.fill")
                }

            }
            .sheet(isPresented: $isFirstTime){
                Text("HeyHo")
            }
            .sheet(isPresented: $isShowingAchievement){
                Text("HeyHo")
            }
        }
    }
}

extension UITabBarController {
    open override func viewWillLayoutSubviews() {
       super.viewWillLayoutSubviews()
       self.tabBar.layer.masksToBounds = true
       self.tabBar.layer.cornerRadius = 20 // whatever you want
       self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner] // only the top right and left corners
        self.tabBar.tintColor = UIColor(named: "TabBarTint")
    }
}
