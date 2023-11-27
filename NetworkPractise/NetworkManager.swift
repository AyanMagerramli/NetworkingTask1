//
//  NetworkManager.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation
final class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func getObjects <T: Codable>(
        type: T.Type,
        urlParam: String = "",
        completion: @escaping (Result<T, Error>) -> Void)
    {
        guard let url = URL(string: baseURL + urlParam) else {return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
            } else {
                do {
                    let items = try JSONDecoder().decode(T.self, from: data!)
                    completion(.success(items))
                    print(items)
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

