//
//  KiliaroTestApp.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import SwiftUI

@main
struct KiliaroTestApp: App {
    @State var isAnimating = true
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                if isAnimating {
                    SplashScreen()
                }else{
                    MainView()
                        .transition(.move(edge: .leading))
                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+1){
                    withAnimation(.easeOut){
                        isAnimating.toggle()
                    }
                    
                }
            }
            
            
        }
    }
}
