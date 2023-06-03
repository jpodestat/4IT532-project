//
//  WebView.swift
//  4IT532-project
//
//  Created by Jan Podestát on 03.06.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
    
    let url: URL
}
