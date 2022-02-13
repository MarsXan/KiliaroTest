//
//  KiliaroError.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation

public struct KiliaroError:Codable{
    var message: String? = nil
    var statusCode: Int? = nil

    enum CodingKeys: String, CodingKey {
        case message = "error"
        case statusCode = "http_code"
    }
}
