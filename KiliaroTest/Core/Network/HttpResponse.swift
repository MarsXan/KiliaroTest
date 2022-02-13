//
//  HttpResponse.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation

struct HttpResponse<T> {
    var body: T? = nil
    var error: NetworkError? = nil
}
