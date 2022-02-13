//
//  ProfileView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack(spacing:0){
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .width(100)
                            .height(100)
                            .cornerRadius(50)
                        
                        Text("Mohsen")
                            .font(.BTitle2)
                            .padding()
                        Spacer()
                        
                    }.padding(.top,.standardPadding)
                    
                    VStack{
                        NavigationLink(destination:
                                SettingView().environmentObject(viewModel)) {
                            MenuItem(title: "Setting", icon: "Setting")
                                
                        }
                        
                        MenuItem(title: "FAQ", icon: "Ticket")
                            .padding(.top,.standardPaddingHalf)
                            .onTapGesture{
                                CommonUtils.openUrl(address: "https://kiliaro.com/")
                            }
                        MenuItem(title: "Information", icon: "Info")
                            .padding(.top,.standardPaddingHalf)
                            .onTapGesture{
                                CommonUtils.openUrl(address: "https://kiliaro.com/")
                            }
                    }.padding(.top,.standardPadding2x)
                    Spacer()
                    
                    
                    
                }
                }.padding()
                    .onAppear{
                        viewModel.isBottomNavVisible = true
                    }
            }
            .background(Color.customWhite.edgesIgnoringSafeArea(.all))
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
