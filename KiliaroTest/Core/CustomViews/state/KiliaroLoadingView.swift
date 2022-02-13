//
//  KiliaroLoadingView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct KiliaroLoadingView: View {
    var title:String = "Loading..."
    var body: some View {
        VStack{
            Spacer()
            VStack {
                
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                Text(title)
                HStack{
                    Spacer()
                }
            }
            Spacer()
               
        }
    }
}

struct KiliaroLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        KiliaroLoadingView()
    }
}
