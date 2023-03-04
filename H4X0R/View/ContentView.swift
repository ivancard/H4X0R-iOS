//
//  ContentView.swift
//  H4X0R
//
//  Created by ivan cardenas on 04/03/2023.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Divider()
                        Text(post.title)
                            .font(.custom("Poppins-Regular", size: 15))
                    }.padding(.vertical)
                }
            }
            .navigationTitle(Text("H4X0R News"))
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
