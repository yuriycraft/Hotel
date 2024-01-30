//
//  LoadableImageView.swift
//  Hotels
//
//  Created by Lol Kek on 29/01/2024.
//

import SwiftUI

struct LoadableImageView: View {
    @ObservedObject private var imageViewModel: ImageViewModel
    
    init(imageViewModel: ImageViewModel) {
        self.imageViewModel = imageViewModel
    }
    
    var body: some View {
        Group {
            if imageViewModel.isLoading {
                ProgressView()
            } else if imageViewModel.isError {
                Text(StringConstants.imageLoadingError)
            } else {
                Image(uiImage: imageViewModel.image ?? UIImage())
                    .resizable()
            }
        }
    }
}
