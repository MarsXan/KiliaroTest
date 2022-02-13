//
//  AlbumItemView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import SwiftUI
import Kingfisher


struct AlbumItemView: View {
    var media:Media
    var body: some View {
        VStack{
            KFImage(ThumbnailUtil.getThumbnailUrl(thumbnail: media.thumbnailUrl ?? "", width: 200,resizeType: .bb))
                .cancelOnDisappear(true)
                .resizable()
                .placeholder {
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            
            Text( "Size:\(String(format:"%.1f",getSize())) MB")
        
            

                
        }
    }
    
    private func getSize() -> Double{
        let size = media.size ?? 0
        return (size.double / 1048576.0)
    }
}

struct AlbumItemView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumItemView(media: Media(id:UUID().uuidString))
    }
}
