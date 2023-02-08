//
//  RepresentOnTheAppStoreView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct RepresentOnTheAppStoreView: View {
    @State private var showImageDetailModal: Bool = false
    var body: some View {
        VStack {
 
            Link(destination: URL(string: "https://apps.apple.com/us/app/represent-app/id1603676693")!) {
                VStack(spacing: 0) {
                    HStack(alignment: .top) {
                        Image("represent_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.leading, 10)
                            .padding(.vertical, 10)
                            .layoutPriority(1)
                        VStack(alignment: .leading) {
                            Text("Represent App")
                                .font(Fonts.font(Fonts.Poppins_Bold, 18))
                                .foregroundColor(.black.opacity(0.9))
                                .layoutPriority(1)
                            Text("The government, simplified")
                                .font(Fonts.font(Fonts.Poppins_Regular, 14))
                                .foregroundColor(.black.opacity(0.9))
                                .padding(.bottom)
                                .layoutPriority(1)
//                            Spacer()
                            Text("GET")
                                .foregroundColor(.white)
                                .font(.caption)
                                .bold()
                                .padding(5)
                                .padding(.horizontal)
                                .background(Color.blue)
                                .clipShape(Capsule())
                              .accessibilityHidden(true)
                        }
                        .padding(.vertical, 10)
                        Spacer()
                    }
                }
                .padding(8)
                .background(Color.white.opacity(0.5))
                .cornerRadius(5)
                .padding()
                .accessibilityAddTraits(.isLink)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                
                Button {
                    self.showImageDetailModal.toggle()
                } label: {
                    HStack {
                        ForEach(1...6, id: \.self) { j in
                            Image("appstore_\(j)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 500)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }

                    }
                    .padding(.horizontal)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("Promotional screenshots of the Represent App")
                }
            
            }
        }
        .sheet(isPresented: self.$showImageDetailModal) {
            AppImagesDetailView(showImageDetailModal: $showImageDetailModal)
        }
    }
}

struct RepresentOnTheAppStoreView_Previews: PreviewProvider {
    static var previews: some View {
        RepresentOnTheAppStoreView()
    }
}
