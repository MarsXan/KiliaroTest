//
//  Media.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation

struct Media:Codable,Hashable,Identifiable{
    var id:String
    var userId:String?
    var mediaType:MediaType?
    var fileName:String?
    var size:Int?
    var createdAt:String?
    var takenAt:String?
    var guessedTakenAt:String?
    var md5sum:String?
    var contentType:String?
    var video:String?
    var thumbnailUrl:String?
    var downloadUrl:String?
    var resx:Int?
    var resy:Int?
    
    
    
}

extension Media{
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "user_id"
        case mediaType = "media_type"
        case fileName = "filename"
        case size="size"
        case createdAt="created_at"
        case takenAt="taken_at"
        case guessedTakenAt="guessed_taken_at"
        case md5sum="md5sum"
        case contentType="content_type"
        case video="video"
        case thumbnailUrl="thumbnail_url"
        case downloadUrl="download_url"
        case resx="resx"
        case resy="resy"
    }
}
