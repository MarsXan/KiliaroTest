//
//  SettingView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI
import Kingfisher

struct SettingView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var present
    @State var showSnnackBar = false
    var body: some View {
        VStack{
            KiliaroNavigationBar(title: "Description",hasRightBtn: false,leftBtnIcon:"Arrow - Left 2",
                                 leftBtnAction: {
                self.present.wrappedValue.dismiss()
            })
            
            VStack{
                HStack(alignment:.top){
                    Image("Delete")
                        .resizable()
                        .renderingMode(.template)
                        .width(.largeIconSize)
                        .height(.largeIconSize)
                        .foregroundColor(.iconColor)
                    
                    VStack(alignment:.leading){
                        Text("Free up Space")
                            .font(.BTitle3)
                            .foregroundColor(.title)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.BBody)
                            .foregroundColor(.n500)
                    }
                    
                    Spacer()
                }
                
            }
            .padding(.horizontal,.standardPadding)
            .padding(.top,.standardPadding2x)
            .onTapGesture{
                KingfisherManager.shared.cache.clearMemoryCache()
                KingfisherManager.shared.cache.clearDiskCache()
                KingfisherManager.shared.cache.cleanExpiredDiskCache()
                showSnnackBar.toggle()
                
            }
            
            Divider()
                .padding(.horizontal)
            Spacer()
            
            
        }
        .onAppear{
            viewModel.isBottomNavVisible = false
        }
        .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .snackBar(isShowing: $showSnnackBar, text: Text("Cache cleared.")){
                showSnnackBar.toggle()
            }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
