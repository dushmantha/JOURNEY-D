
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * All the network services include in this file.
 */


import SwiftUI

// MARK: - Service

class Service {
    
    // MARK: - Posts
    func getPosts(endPath : String, completion: @escaping ([Post]) -> ()) {
        let urlPath = Constants.Network.BASE_URL + endPath
        guard let url = URL(string: urlPath) else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = Constants.Network.HTTPS_METHOD
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Post].self, from: data) {
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    // MARK: - Commnets
    func getCommnets(endPath : String, postId: String, completion: @escaping ([Comment]) -> ()) {
        let urlPath = Constants.Network.BASE_URL + endPath + postId
        guard let url = URL(string: urlPath) else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = Constants.Network.HTTPS_METHOD
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Comment].self, from: data) {
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}
