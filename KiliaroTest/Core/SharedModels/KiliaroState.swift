//
//  KiliaroState.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation
enum KiliaroState<T> {
    case loading
    case empty
    case error(NetworkError)
    case success(T)
}
