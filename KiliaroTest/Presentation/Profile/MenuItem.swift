//
//  MenuItem.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct MenuItem: View {
    var title:String
    var icon:String
    
    var body: some View {
        HStack{
            Image(icon)
                .resizable()
                .width(.largeIconSize)
                .height(.largeIconSize)
                .foregroundColor(.iconColor)
            
            Text(title)
                .font(.BTitle3)
                .foregroundColor(.title)
               
            Spacer()
        }
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(title: "Setting", icon: "Setting")
    }
}
