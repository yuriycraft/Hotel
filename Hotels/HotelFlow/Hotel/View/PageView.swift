//
//  PageView.swift
//  Hotels
//
//  Created by Lol Kek on 14/01/2024.
//

import SwiftUI

struct PageView: View {
     var urlArray: [String]

    var body: some View {
        TabView {
            ForEach(urlArray, id: \.self) { url in
                let imageModel = ImageViewModel(urlString: url)
                PageTabView(imageViewModel: imageModel)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct PageTabView: View {
    @ObservedObject var imageViewModel: ImageViewModel

    var body: some View {
        GeometryReader { geometry in
            LoadableImageView(imageViewModel: imageViewModel)
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear {
                    imageViewModel.loadImage()
                }
        }
    }
}
