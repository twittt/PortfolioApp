//
//  WebViewModel.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import WebKit

class WebViewModel: ObservableObject {
    
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    let webView: WKWebView
    let url: URL
    var link: String
    
    init(link: String) {
        self.link = link
        webView = WKWebView(frame: .zero)
        url = URL(string: "example.com")!
        loadUrl()
    }
    
    func loadUrl() {
        guard let url = URL(string: link) else {
            print("Failed to convert url string to URL object")
            return
        }
        
        webView.load(URLRequest(url: url))
        webView.sizeToFit()
        webView.scrollView.minimumZoomScale = 1.5
        webView.contentScaleFactor = 2
    }
    
    private func setupBindings() {
        webView.publisher(for: \.canGoBack)
            .assign(to: &$canGoBack)
        webView.publisher(for: \.canGoForward)
            .assign(to: &$canGoForward)
    }
    
    func goForward() {
        webView.goForward()
    }
    func goBack() {
        webView.goBack()
    }
}
