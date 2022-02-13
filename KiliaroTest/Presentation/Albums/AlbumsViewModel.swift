//
//  AlbumsViewModel.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation
import Combine

class AlbumsViewModel:ObservableObject{
    var repo: AlbumsRepo = AlbumsRepo()
    
    var bag = Set<AnyCancellable>()
    @Published var errorMessage = ""
    @Published var isErrorBannerShown = false
    
    
    @Published var state:KiliaroState<[Media]> = .empty
    
     init(){
         getAlbums()
    }
    
    deinit{
        self.bag.removeAll()
    }
    
    
}

extension AlbumsViewModel{
    func getAlbums(){
        self.state = .loading
        self.repo
            .getAlbums()
            .map{
                HttpResponse(body: $0)
            }
            .catch({
                Just(HttpResponse(error: $0))
            })
                    .sink(receiveValue: {
                        
                        if let error = $0.error {
                            self.state = KiliaroState.error(error)
                            self.isErrorBannerShown = true
                            self.errorMessage = ErrorUtil.errorToString(error: error)
                        }else{
                            self.state = $0.body!.count > 0 ? KiliaroState.success($0.body!):KiliaroState.empty
                        }
                    })
                    .store(in: &bag)
    }
}
