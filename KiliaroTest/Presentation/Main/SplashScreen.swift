//
//  SplashScreen.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct SplashScreen: View {
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("logo")
                HStack{Spacer()}
                Spacer()
            }
        }.background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
