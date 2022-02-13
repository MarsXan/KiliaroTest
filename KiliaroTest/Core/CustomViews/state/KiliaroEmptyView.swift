//
//  KiliaroEmptyView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct KiliaroEmptyView: View {
    var logo:String = "logo"
    var title = "No Item Added"
    var body: some View {
        VStack{
            Spacer()
            Image(logo)
            Text(title)
                .font(.BLargeBody)
                .foregroundColor(.title)
                .padding(.horizontal)
            Spacer()
        }
    }
}

struct KiliaroEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        KiliaroEmptyView()
    }
}
