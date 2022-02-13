//
//  AlbumsApi.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation
import Combine
protocol AlbumsApi{
    func getAlbums()->AnyPublisher<[Media],NetworkError>
}
