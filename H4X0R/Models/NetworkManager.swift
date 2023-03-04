//
//  NetworkManager.swift
//  H4X0R
//
//  Created by ivan cardenas on 04/03/2023.
//

import Foundation

class NetworkManager: ObservableObject {

    @Published var posts = [Post]()

    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let urlSession = URLSession(configuration: .default)

            urlSession.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do{
                        let decodedData = try decoder.decode(NewsResult.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = decodedData.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
