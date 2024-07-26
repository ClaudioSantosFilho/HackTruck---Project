import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView{
            
            FrontPag()
                .tabItem {
                    Label("Começo",systemImage: "house.circle")
                }
            
            MapView()
                .tabItem {
                    Label("Mapa",systemImage: "map.circle.fill")
                }
            
            LocalSalvoView()
                .tabItem {
                    Label("Locais salvos",systemImage: "list.bullet.rectangle.portrait")
                }
            
        }
        
        
    }
}

#Preview {
    MainView()
}
