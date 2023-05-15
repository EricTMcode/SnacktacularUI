//
//  SpotDetailPhotoScrollView.swift
//  SnacktacularUI
//
//  Created by Eric on 15/05/2023.
//

import SwiftUI

struct SpotDetailPhotoScrollView: View {
//    struct FakePhoto: Identifiable {
//        let id = UUID().uuidString
//        var imageURLString = "https://firebasestorage.googleapis.com:443/v0/b/snacktacularui-e7088.appspot.com/o/VgWKiDab5D9kkMzIKZFM%2F0917B08C-5C05-425E-A171-56FD3DB7DBA4.jpeg?alt=media&token=d2019db7-5fbf-425e-8dee-0e5fd68d8a2b"
//
//    }
//    let photos = [FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto()]
    
    @State private var showPhotoViewerView = false
    @State private var uiImage = UIImage()
    var photos: [Photo]
    var spot: Spot
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(photos) { photo in
                    let imageURL = URL(string: photo.imageURLString) ?? URL(string: "")
                    
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .onTapGesture {
                                let renderer = ImageRenderer(content: image)
                                uiImage = renderer.uiImage ?? UIImage()
                                showPhotoViewerView.toggle()
                            }
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                }
            }
        }
        .frame(height: 80)
        .padding(.horizontal, 4)
        .sheet(isPresented: $showPhotoViewerView) {
            PhotoView(uiImage: uiImage, spot: spot)
        }
    }
}

struct SpotDetailPhotoScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SpotDetailPhotoScrollView(photos: [Photo(imageURLString: "https://firebasestorage.googleapis.com:443/v0/b/snacktacularui-e7088.appspot.com/o/VgWKiDab5D9kkMzIKZFM%2F0917B08C-5C05-425E-A171-56FD3DB7DBA4.jpeg?alt=media&token=d2019db7-5fbf-425e-8dee-0e5fd68d8a2b")], spot: Spot(id: "0917B08C"))
    }
}
