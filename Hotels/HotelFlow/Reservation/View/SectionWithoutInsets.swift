//
//  SectionWithoutInsets.swift
//  Hotels
//
//  Created by Lol Kek on 28/01/2024.
//

import SwiftUI

struct SectionWithoutInsets<Content: View>: View {
    var last: Bool = false
    var content: Content

    init(@ViewBuilder content: () -> Content, last: Bool = false) {
        self.content = content()
        self.last = last
    }

    var body: some View {
        let header = Color.clear
            .frame(height: DimensionConstants.sectionHeaderHeight8)
            .listRowInsets(EdgeInsets())
        let footer = Color.clear
            .frame(height: last ? DimensionConstants.sectionHeaderHeight8 : DimensionConstants.sectionFooterHeight0)
            .listRowInsets(EdgeInsets())
        Section(header: header, footer: footer) {
            content
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
    }
}
