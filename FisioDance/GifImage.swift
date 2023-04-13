//
//  WebView.swift
//  cameraApp
//
//  Created by sofiadinizms on 09/04/23.
//

import SwiftUI
import WebKit

//struct WebView : UIViewRepresentable {
//
//    let request: URLRequest
//
//    func makeUIView(context: Context) -> WKWebView  {
//        return WKWebView()
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        uiView.load(request)
//    }
//
//}

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }

}


struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        GifImage("pokeball")
    }
}
//
//#if DEBUG
//struct WebView_Previews : PreviewProvider {
//    static var previews: some View {
//        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
//    }
//}
//#endif
