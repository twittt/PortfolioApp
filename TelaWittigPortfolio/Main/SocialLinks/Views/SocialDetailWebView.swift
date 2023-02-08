//
//  SocialDetailWebView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI
import WebKit

struct DetailWebView: View {
    @Environment(\.openURL) var openURL
    @StateObject var model: WebViewModel
    
    var body: some View {
        WebView(webView: model.webView)
    }
}




struct DetailWebView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWebView(model: WebViewModel(link: "https://www.linkedin.com/in/tela-wittig/"))
    }
}
