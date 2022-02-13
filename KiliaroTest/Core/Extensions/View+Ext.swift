//
//  View+Ext.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView { AnyView(self) }
    
    #if canImport(UIKit)
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    #endif
    
    func toast(isShowing: Binding<Bool>, text: Text) -> some View {
        Toast(isShowing: isShowing,
              presenting: { self },
              text: text)
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func snackBar(isShowing: Binding<Bool>,
                     text: Text,
                     actionText: Text? = nil,
                     action: (() -> Void)? = nil) -> some View {

           Snackbar(isShowing: isShowing,
                    presenting: self,
                    text: text,
                    actionText: actionText,
                    action: action)

       }
    
    
}
