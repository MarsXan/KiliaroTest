//
//  KiliaroConstants.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation

struct KiliaroConstants {
    
    
    #if DEBUG
    static let BASE_URL = URL(string: "https://api1.kiliaro.com/")!
    static let SHARE_ID = "djlCbGusTJamg_ca4axEVw"
    
    
    #else
    static let BASE_URL = URL(string: "https://api1.kiliaro.com/")!
    static let SHARE_ID = "djlCbGusTJamg_ca4axEVw"
    
    
    #endif
    
    
}
