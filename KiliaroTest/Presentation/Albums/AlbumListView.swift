//
//  AlbumView.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//


import SwiftUI
import Kingfisher

struct AlbumListView:View{
    @ObservedObject var viewModel = AlbumsViewModel()
    @State var selectedMedia:Media? = nil
    @State var showFullScreen:Bool = false
    @Namespace var namespcae
    
    
    var body: some View {
        
        ZStack{
            
            if showFullScreen{
                VStack{
                    Spacer()
                    KFImage(ThumbnailUtil.getThumbnailUrl(thumbnail: selectedMedia!.thumbnailUrl ?? "", resizeType: .bb))
                        .cancelOnDisappear(true)
                        .resizable()
                        .placeholder {
                            ActivityIndicator(isAnimating: .constant(true), style: .large)
                        }
                        .aspectRatio(contentMode: .fit)
                    
                        .matchedGeometryEffect(id: selectedMedia!.id, in: namespcae)
                    
                    Text( DateTimeUtil.getDayAndmonth(time: selectedMedia!.createdAt ?? ""))
                    Spacer()
                    
                        HStack{
                            Button(action:{
                                withAnimation(.spring()){
                                    showFullScreen.toggle()
                                }
                            }){
                                Image(systemName: "xmark")
                                    .foregroundColor(.customBlack)
                                    .padding()
                                    .background(Color.customBlack.opacity(0.3))
                                    .clipShape(Circle())
                                    .minWidth(UIScreen.main.bounds.width-32)
                                    
                            }
                        }
                        .padding(.bottom,16)
                        .padding(.horizontal)
                    
                }.background(Color.customWhite )
            }else{
                switch viewModel.state {
                    
                case .loading:
                      KiliaroLoadingView()
                case .empty:
                      KiliaroEmptyView( title: "No Album added")
                        .padding(.top,-60)
                      
                case .error(let error):
                      VStack {
                        Spacer()
                        KiliaroErrorView( title: "Error", content: ErrorUtil.errorToString(error: error), hasRetry: true, btnText: "Retry", retryAction: {viewModel.getAlbums()})
                        Spacer()
                    }
                case .success(let list):
                     StaggeredGrid(columns: 3, list: list,content: { media in
                        AlbumItemView(media: media)
                            .onTapGesture{
                                withAnimation(.spring()){
                                    selectedMedia = media
                                    showFullScreen.toggle()
                                }
                            }.matchedGeometryEffect(id: media.id, in: namespcae)
                    })
                        .padding(.horizontal)
                        
                    
                }
                
            }
        }
        .background(Color.customWhite.edgesIgnoringSafeArea(.all))
        .statusBar(hidden: showFullScreen ? true : false)
        
    }
}

struct AlbumsListView_Previews:PreviewProvider{
    static var previews: some View{
        AlbumListView()
    }
}
