//
//  PageView.swift
//  Hotels
//
//  Created by Lol Kek on 14/01/2024.
//

import SwiftUI

struct PageView: View {
    var urlArray: [String]
    @State private var selectedTabIndex: Int = 0

    init(urlArray: [String]) {
        self.urlArray = urlArray
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTabIndex.animation()) {
                ForEach(0..<urlArray.count, id: \.self) { index in
                    let imageModel = ImageViewModel(urlString: urlArray[index])
                    PageTabView(imageViewModel: imageModel)
                        .tag(urlArray[index])
                        .cornerRadius(LayoutConstants.cornerRadius15, corners: .allCorners)
                }

            }.tabViewStyle(.page(indexDisplayMode: .never))

            CustomPageControl(numberOfPages: urlArray.count,
                              currentIndex: $selectedTabIndex)
                .padding(.bottom, 8)
        }
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

struct CustomPageControl: View {
    let numberOfPages: Int
    @Binding var currentIndex: Int
    private let circleSize: CGFloat = 8
    private let circleSpacing: CGFloat = 5
    private let opacities: [Double] = [1.0, 0.22, 0.17, 0.10, 0.05]

    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                if shouldShowIndex(index) {
                    Circle()
                        .fill(.black)
                        .opacity(opacity(for: index))
                        .frame(width: circleSize, height: circleSize)
                        .id(index)
                }
            }
        }.padding(EdgeInsets(top: LayoutConstants.padding5,
                             leading: LayoutConstants.padding10,
                             bottom: LayoutConstants.padding5,
                             trailing: LayoutConstants.padding10))
            .frame(height: 17)
            .background(.white)
            .cornerRadius(LayoutConstants.cornerRadius5)
    }

    private func shouldShowIndex(_ index: Int) -> Bool {
        let start = index < 5 ? 4 : 2
        let end = numberOfPages - index < 6 ? 5 : 2
        return ((currentIndex - end) ... (currentIndex + start)).contains(index)
    }

    private func opacity(for index: Int) -> Double {
        let distance = abs(currentIndex - index)
        return distance < opacities.count ? opacities[distance] : 0
    }
}
