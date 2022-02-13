//
//  KiliaroErrorView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import SwiftUI
import SwiftUIX

struct KiliaroErrorView: View {
    var icon:Image = Image("Info Circle")
    var title:String = "No Internet connection"
    var content:String = "Please check your Internet and try again"
    var hasRetry = true
    var btnText = "Try Again"
    var retryAction:()->Void = {}
    
    
    var body: some View {
        VStack(spacing:.standardSpacing){
            
            icon
                .resizable()
                .renderingMode(.template)
                .width(64)
                .height(64)
                .foregroundColor(Color.iconColor)
            
            VStack(spacing:8){
                Text(title)
                    .font(.BTitle3)
                    .foregroundColor(.title)
                    .lineLimit(1)
                Text(content)
                    .font(.BSubhead)
                    .foregroundColor(.title)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            
            
            
            
            if hasRetry {
                KiliaroButton(title: btnText, color: .p400, buttonSize: .medium,font:.BCallout)
                {
                    self.retryAction()
                }
                    .width(100)
            }
            
        }
    }
}

struct KiliaroErrorView_Previews: PreviewProvider {
    static var previews: some View {
        KiliaroErrorView()
    }
}
