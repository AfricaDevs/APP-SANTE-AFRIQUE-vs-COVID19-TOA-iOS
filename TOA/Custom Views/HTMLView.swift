//
//  HTMLView.swift
//  TOA
//
//  Created by Steven on 7/4/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI
import WebKit


struct HTMLView : UIViewRepresentable {
    
    var htmlString : String
    typealias UIViewType = WKWebView
    
    func makeUIView(context: UIViewRepresentableContext<HTMLView>) -> WKWebView {
        
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
     
    
}
