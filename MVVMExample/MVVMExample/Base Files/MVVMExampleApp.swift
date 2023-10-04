//Created by Lugalu on 03/09/23.

import SwiftUI

@main
struct MVVMExampleApp: App {
    @AppStorage("isFirstTime") var isFirstTime = true
    @AppStorage("isShowingAchievement") var isShowingAchievement = false
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "TabBarBlue")
        UITabBar.appearance().backgroundColor = UIColor(named: "TabBarBlue")
        UITabBar.appearance().tintColor = UIColor(named: "TabBarTint")
        UITabBar.appearance().tintAdjustmentMode = .normal
    }
    
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationStack {
                    OverviewView()
                }
                .tabItem{
                    Label("Overview", systemImage: "heart.fill")
                        .foregroundColor(Color("TabBarTint"))
                        .tint(Color("TabBarTint"))
                        .symbolRenderingMode(.monochrome)
                        
                }

            }
            .toolbarColorScheme(.none, for: .automatic)
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
