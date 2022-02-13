//
//  CommonUtils.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import SwiftUI

struct CommonUtils{
    static func openUrl(address: String) {
        if let url = URL(string: address) {
            UIApplication.shared.open(url)
        }
    }
}
