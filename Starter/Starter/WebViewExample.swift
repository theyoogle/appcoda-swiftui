//
//  WebViewExample.swift
//  Starter
//
//  Created by The YooGle on 28/05/22.
//

import SwiftUI
import WebKit

struct WebViewExample: View {
    var body: some View {
        WebView(url: "https://www.apple.com")
    }
}

struct WebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.load(URLRequest(url: URL(string: url)!))
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}























struct WebViewExample_Previews: PreviewProvider {
    static var previews: some View {
        WebViewExample()
    }
}
