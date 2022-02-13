//
//  CustomerTabView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab:CustomTabType
    @State var tabType:CustomTabType = .albums
    
    var tabs:[CustomTab]
    
    var body: some View {
        VStack(spacing:0) {
            HStack(spacing:0){
                ForEach(tabs){tab in
                    RoundedRectangle(cornerRadius: 0.5)
                        .height(1)
                        .visible(selectedTab == tab.type)
                        .foregroundColor(selectedTab == tab.type ? .p400 : .n900)
                    
                }
            }
            
            Divider()
            Divider()
            HStack(spacing:0){
                ForEach(tabs){tab in
                    
                    Spacer()
                    Button(action: {
                        withAnimation{
                            self.selectedTab = tab.type
                            self.tabType = tab.type
                        }
                        
                    }) {
                        VStack{
                            Image(tab.image)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: .iconSize, height: .iconSize)
                                .foregroundColor(selectedTab == tab.type ? .p400 : Color.iconColor.opacity(0.3))
                        }
                    }
                    Spacer()
                }
                
            }.padding(.top,.standardPaddingHalf)
            
            
        }.padding(.bottom)
    }
}

struct CustomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selectedTab:.constant(.albums), tabs: [.init(type: .albums, image: "Albums"),.init(type: .local, image: "Locals"),.init(type: .home, image: "Home"),.init(type: .live, image: "Live"),.init(type: .profile, image: "Profile")])
    }
}

struct CustomTab:Identifiable{
    var id = UUID().uuidString
    var type:CustomTabType
    var image:String
}

enum CustomTabType {
    case albums,local,home,live,profile
}



