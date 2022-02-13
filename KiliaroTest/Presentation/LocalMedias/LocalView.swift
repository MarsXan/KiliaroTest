//
//  LocalView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct LocalView: View {
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                Text("your Local is empty now \nLocal Media will be available here")
                    .font(.BBody)
                    .multilineTextAlignment(.center)
            }.navigationTitle("Local")
        }
    }
}

struct LocalView_Previews: PreviewProvider {
    static var previews: some View {
        LocalView()
    }
}
