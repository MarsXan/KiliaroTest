//
//  AlbumsRepo.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation
import Combine

struct AlbumsRepo:AlbumsApi{
    private let agent = NetworkAgent()
    
    func getAlbums() -> AnyPublisher<[Media], NetworkError> {
        var request = URLComponents.init(url: NetworkUtil.getApiUrl(of: "shared/\(KiliaroConstants.SHARE_ID)/media"), resolvingAgainstBaseURL: true)?.request
        request?.httpMethod = HttpMethod.get.rawValue
        return agent.run(request!)
    }
    
    
}
