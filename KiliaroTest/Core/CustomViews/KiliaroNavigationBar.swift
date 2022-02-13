//
//  KiliaroNavigationBar.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct KiliaroNavigationBar: View {
    var title:String
    var titleColor:Color = Color.primary
    var leftBtnTexttColor:Color = Color.title
    var hasRightBtn:Bool=true
    var rightBtnText:String = "Done"
    var hasLeftBtn:Bool = true
    var leftBtnTitle:String = "Cancel"
    var leftBtnIcon:String? = nil
    var rightBtnIcon:String? = nil
    var isDisable:Bool = false
    var rightBtnAction:()->Void={}
    var leftBtnAction:()->Void={}
    
    var body: some View {
        ZStack{
            
            HStack{
                
                /// Left Btn
                if hasLeftBtn{
                    if leftBtnIcon != nil {
                        Button(action: {
                            self.leftBtnAction()
                        }) {
                            Image(leftBtnIcon!)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: .iconSize, height: .iconSize)
                                .foregroundColor(.iconColor)
                              
                        }
                    }else{
                        Button(action: {
                            self.leftBtnAction()
                        }) {
                            Text(leftBtnTitle)
                                .foregroundColor(leftBtnTexttColor)
                            .font(.BHeadline)
                              
                        }
                    }
                    
                }
                Spacer()
                
                /// Right Btn
                if hasRightBtn {
                    if rightBtnIcon != nil {
                        Button(action: {
                            self.rightBtnAction()
                        }) {
                            Image(rightBtnIcon!)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: .iconSize, height: .iconSize)
                                .foregroundColor(.iconColor)
                              
                        }
                    }
                    else{
                        Button(action:self.rightBtnAction) {
                            Text(rightBtnText)
                                .foregroundColor(.white)
                                .font(.BHeadline)
                                .padding(.horizontal)
                        }
                        .height(36)
                        .background(isDisable ? Color.disabled_primary : Color.p400)
                        .cornerRadius(.standardRadius)
                        .disabled(isDisable)
                    }
                   
                }
            }.padding()
            
            Text(title)
                .font(.BTitle3)
                .foregroundColor(titleColor)
            
            if !hasLeftBtn && !hasRightBtn {
                Image(rightBtnIcon!)
                    .renderingMode(.template)
                    .foregroundColor(.iconColor)
                    .frame(width: .iconSize, height: .iconSize)
                    .padding()
                    .visible(false)
            }
        }
    }
}

struct KiliaroNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KiliaroNavigationBar(title: "Description")
                .previewLayout(.sizeThatFits)
            KiliaroNavigationBar(title: "Description")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            KiliaroNavigationBar(title: "Description",isDisable:true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            KiliaroNavigationBar(title: "Description",hasRightBtn: false)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            KiliaroNavigationBar(title: "Description",hasRightBtn: false)
                .previewLayout(.sizeThatFits)
            KiliaroNavigationBar(title: "Description", rightBtnText: "Import",leftBtnIcon:"close-1",
                              rightBtnAction: {},
                              leftBtnAction: {})
                .previewLayout(.sizeThatFits)
            
            KiliaroNavigationBar(title: "Description",hasRightBtn: false,leftBtnIcon:"close-1",
                              leftBtnAction: {})
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            KiliaroNavigationBar(title: "Description",hasRightBtn: true,leftBtnIcon:"Arrow - Left Circle",rightBtnIcon: "More Circle",
                              leftBtnAction: {})
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            KiliaroNavigationBar(title: "Description",hasRightBtn: false,hasLeftBtn: false,leftBtnIcon:"Arrow - Left Circle",rightBtnIcon: "More Circle",
                              leftBtnAction: {})
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                
        }
    }
}


