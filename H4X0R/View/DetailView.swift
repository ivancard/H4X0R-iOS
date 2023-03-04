//
//  DetailView.swift
//  H4X0R
//
//  Created by ivan cardenas on 04/03/2023.
//

import SwiftUI
import WebKit

struct DetailView: View {

    let url: String?

    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://ivancardenas.vercel.app/")
    }
}
