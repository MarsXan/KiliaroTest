//
//  KiliaroButton.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import SwiftUI

struct KiliaroButton: View {
    var title: String = "button"
    var color: Color = Color.p400
    
    var textColor:Color = .white
    var fgColor: Color = Color.white
    var buttonSize: ButtonSize = .medium
    var cornerRadius: CGFloat = 16
    var style: ButtonStyle = .normal
    var leftIcon: Image? = nil
    var rightIcon: Image? = nil
    var centerIcon: Image? = nil
    var iconColor: Color? = nil
    var iconSize:CGFloat = .iconSize
    var iconRenderMode: Image.TemplateRenderingMode = .template
    var borderColor: Color = Color.n200
    var isDisabled: Bool = false
    var disabledColor:Color =  .disabled_primary
    var disabledTextColor:Color = Color.disabled_text.opacity(0.3)
    var font:Font = .BTitle3
    var alignment:Alignment = .center
    var state:ViewState = .content
    var action: () -> Void = {
    }
    var body: some View {
        Button(action: {
            self.action()
        }) {
            
            
            ZStack() {
                HStack(spacing:8){
                    if alignment == .center || alignment == .right
                    { Spacer() }
                    if state != .loading {
                        if centerIcon != nil {
                            HStack {
                                centerIcon?
                                    .renderingMode(iconRenderMode)
                                    .resizable()
                                    .frame(width: iconSize, height: iconSize)
                                    .foregroundColor(iconColor)
                                
                                
                            }
                        }
                        
                        Text(title)
                            .foregroundColor(isDisabled ? textColor.opacity(0.3) : textColor)
                            .font(font)
                            .padding(.leading,alignment == .left ? iconSize+32  :0)
                            .padding(.trailing,alignment == .right ? iconSize+32   :0)
                    }else{
                        HStack(spacing:0){
                           // loading
                        }
                        
                    }
                    
                    if alignment == .center || alignment == .left
                    {
                        Spacer()
                        
                    }
                }
                if leftIcon != nil {
                    HStack {
                        leftIcon?
                            .renderingMode(iconRenderMode)
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .foregroundColor(iconColor)
                            .padding(.horizontal, .standardPadding)
                        Spacer()
                    }
                }
                
                if rightIcon != nil {
                    HStack {
                        Spacer()
                        rightIcon?
                            .renderingMode(iconRenderMode)
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .foregroundColor(iconColor)
                            .padding(.horizontal, 16)
                    }
                }
            }
        }
        .foregroundColor(fgColor)
        .frame(height: CGFloat(buttonSize.rawValue))
        .background(isDisabled ? disabledColor : color)
        .cornerRadius(cornerRadius)
        .disabled(isDisabled)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(style == ButtonStyle.Linear ? borderColor : .clear, lineWidth: style == ButtonStyle.Linear ? 0.5 : 0)
        )
    }
    
    
}

struct KiliaroButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KiliaroButton()
                .previewLayout(.sizeThatFits)
                .padding()
            
            
            KiliaroButton(title:"$19.99 / Month",buttonSize: .medium)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .padding()
            
            KiliaroButton(title: "Apple", color: .clear, textColor: .title, fgColor: .title, buttonSize: .Large, style: .Linear, leftIcon: Image("apple"), iconColor: .title, iconRenderMode: .template,  font: .BTitle3){}
                .previewLayout(.sizeThatFits)
                .padding()
            
            KiliaroButton(title: "Apple", color: .clear, textColor: .title, fgColor: .title, buttonSize: .Large, style: .Linear, leftIcon: Image("apple"), iconColor: .title, iconRenderMode: .template,  font: .BTitle3,state: .loading){}
                .previewLayout(.sizeThatFits)
                .padding()
            
            KiliaroButton(title: "Apple", color: .clear, textColor: .title, fgColor: .title, buttonSize: .Large, style: .Linear, leftIcon: Image("apple"), iconColor: .title, iconRenderMode: .template,  font: .BTitle3){}
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .padding()
            
            KiliaroButton(title: "", color: .clear, buttonSize: .Large, style: .Linear,leftIcon: Image("apple"), rightIcon: Image("google"),centerIcon: Image("facebook"), iconColor: .title, iconRenderMode: .original,  font: .BTitle3)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}

enum ButtonSize: Int {
    case XLarge = 64
    case Large = 56
    case medium = 48
    case Small = 40
}

enum ButtonStyle {
    case normal
    case Linear
}

enum Alignment{
    case center,left,right
}

