//
//  WebView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {

    typealias UIViewType = WKWebView
    let webView: WKWebView
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
