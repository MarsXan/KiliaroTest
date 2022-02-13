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
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .width(240)
                .height(240)
        }.background(Color.customWhite.edgesIgnoringSafeArea(.all))
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
