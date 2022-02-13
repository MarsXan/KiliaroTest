//
//  ShareView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct ShareView: View {
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                Text("your contact list is empty. Invite your friends to enjoy Kiliaro toghether.")
                    .font(.BBody)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }.navigationTitle("Share")
        }
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
