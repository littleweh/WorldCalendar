//
//  DayWebView.swift
//  WorldCalendar
//
//  Created by 小威 on 2022/3/27.
//

import SwiftUI
import WebKit

struct DayWebView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
