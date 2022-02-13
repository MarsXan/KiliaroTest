//
//  CustomFonts.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import SwiftUI

fileprivate let boldFont = "ProductSans-Bold"
fileprivate let regularFont = "ProductSans-Regular"


extension Font {
    static let BLargeTitle = Font.custom(boldFont, size: 34)
    static let BTitle1 = Font.custom(boldFont, size: 28)
    static let BTitle2 = Font.custom(boldFont, size: 22)
    static let BTitle3 = Font.custom(boldFont, size: 20)
    static let BTitle3Regular = Font.custom(regularFont, size: 20)
    static let BHeadline = Font.custom(boldFont, size: 17)

    static let BInput = Font.custom(regularFont, size: 22)
    static let BBody = Font.custom(regularFont, size: 17)
    static let BLargeBody = Font.custom(regularFont, size: 20)
    static let BCallout = Font.custom(regularFont, size: 16)
    static let BSubhead = Font.custom(regularFont, size: 15)
    static let BFootnote = Font.custom(regularFont, size: 13)
    static let BCaption1 = Font.custom(regularFont, size: 12)
    static let BCaption2 = Font.custom(regularFont, size: 11)
}


extension UIFont {
    private static func getProductSansFont(for name: String, of size: CGFloat) -> UIFont {
        UIFont(name: name, size: size)!
    }

    static let BLargeTitle = getProductSansFont(for: boldFont, of: 34)
    static let BTitle1 = getProductSansFont(for: boldFont, of: 28)
    static let BTitle2 = getProductSansFont(for: boldFont, of: 22)
    static let BTitle3 = getProductSansFont(for: boldFont, of: 20)
    static let BTitle3Regular = getProductSansFont(for: regularFont, of: 20)
    static let BHeadline = getProductSansFont(for: boldFont, of: 17)

    static let BInput = getProductSansFont(for: regularFont, of: 22)
    static let BBody = getProductSansFont(for: regularFont, of: 17)
    static let BLargeBody = getProductSansFont(for: regularFont, of: 20)
    static let BCallout = getProductSansFont(for: regularFont, of: 16)
    static let BSubhead = getProductSansFont(for: regularFont, of: 15)
    static let BFootnote = getProductSansFont(for: regularFont, of: 13)
    static let BCaption1 = getProductSansFont(for: regularFont, of: 12)
    static let BCaption2 = getProductSansFont(for: regularFont, of: 11)
}

