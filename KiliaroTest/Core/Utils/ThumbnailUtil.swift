//
//  ThumbnailUtil.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import Foundation
struct ThumbnailUtil {
    static func  getThumbnailUrl(thumbnail:String,width:Int? = nil,height:Int? = nil ,resizeType:ThumnailResizeMode? = nil) -> URL{
        
       var url =  URL(string: thumbnail)!
        var params = [String:String]()
        
        if let w = width {
            params["w"] = w.string
        }
        if let h = height {
            params["h"] = h.string
        }
        
        if let m = resizeType {
            params["m"] = m.rawValue
        }
        
        url.appendQueryParameters(params)
       
        return url
    }
}

enum ThumnailResizeMode:String{
    case bb="bb",crop="crop",md="md"
}
