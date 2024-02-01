//
//  AdditionalInfoView.swift
//  Hotels
//
//  Created by Lol Kek on 15/01/2024.
//

import SwiftUI
struct TagView: View {
    var tags: [String]

    @State private var totalHeight = CGFloat.zero

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in gProxy: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 4)
                    .alignmentGuide(.leading, computeValue: { value in
                        if abs(width - value.width) > gProxy.size.width {
                            width = 0
                            height -= value.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0
                        } else {
                            width -= value.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        Text(text)
            .font(FontConstants.font16Medium)
            .foregroundColor(ColorConstants.primaryText)
            .padding(EdgeInsets(top: LayoutConstants.padding5,
                                leading: LayoutConstants.padding10,
                                bottom: LayoutConstants.padding5,
                                trailing: LayoutConstants.padding10))
            .background(ColorConstants.additionalBackground)
            .cornerRadius(LayoutConstants.cornerRadius5)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct TrueTagView: View {
    var tags: [String]
    var body: some View {
        TagView(tags: tags)
    }
}
