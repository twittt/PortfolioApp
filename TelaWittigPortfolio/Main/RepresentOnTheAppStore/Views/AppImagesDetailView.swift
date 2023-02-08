//
//  AppImagesDetailView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct AppImagesDetailView: View {
    @Binding var showImageDetailModal: Bool
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        self.showImageDetailModal.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding()
                            .foregroundColor(.primary)
                    }
                    .accessibilityIdentifier("dismissModalView")
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1...6, id: \.self) { j in
                        Image("appstore_\(j)")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
                .padding(.horizontal)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Promotional screenshots of the Represent App")
            }
        }
    }
}

struct AppImagesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppImagesDetailView(showImageDetailModal: .constant(true))
    }
}
