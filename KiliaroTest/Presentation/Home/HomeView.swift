//
//  HomeView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                Text("your feed is empty now \nMedia shared with you will be available here")
                    .font(.BBody)
                    .multilineTextAlignment(.center)
            }.navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
