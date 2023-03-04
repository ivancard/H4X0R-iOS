//
//  PostData.swift
//  H4X0R
//
//  Created by ivan cardenas on 04/03/2023.
//

import Foundation

struct NewsResult: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
