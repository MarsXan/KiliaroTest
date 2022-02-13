//
//  ContentView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel = MainViewModel()
    var tabs:[CustomTab] = [
        .init(type: .albums, image: "Albums"),
        .init(type: .local, image: "Locals"),
        .init(type: .home, image: "Home"),
        .init(type: .live, image: "Live"),
        .init(type: .profile, image: "Profile")
    ]
    
    @State var selectedTab:CustomTabType = .albums
    var body: some View {
        
        VStack{
            content
            Spacer()
            if(viewModel.isBottomNavVisible)
            {
                CustomTabView(selectedTab: $selectedTab,tabs: tabs)
                
            }
            
        }
    }
    
    var content:AnyView {
        switch selectedTab {
            
        case .albums:
            return AlbumListView().eraseToAnyView()
        case .local:
            return LocalView().eraseToAnyView()
        case .home:
            return HomeView().eraseToAnyView()
        case .live:
            return ShareView().eraseToAnyView()
        case .profile:
            return ProfileView().environmentObject(viewModel).eraseToAnyView()
                
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
    }
}
