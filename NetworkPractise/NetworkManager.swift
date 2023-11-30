//
//  NetworkManager.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://jsonplaceholder.typicode.com/"
   
    //MARK: - URLSession
    
    //GET
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
    
    
    //POST
    func createObjects <T: Codable>(
        type: T.Type,
        urlParam: String = "",
        model: PostResponseModel,
        completion: @escaping (Result<T, Error>) -> Void)
    {
        guard let url = URL(string: baseURL + urlParam) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-type":"application/json", "charset":"UTF-8"]
        do {
            request.httpBody = try JSONEncoder().encode(model)
        } catch {
            print(error.localizedDescription)
        }
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
    
    //MARK: -Alamofire
    
    //GET
    func getObjectsForAlamofire <T:Codable>(
        type: T.Type,
        urlParam: String = "",
        completion: @escaping((Result<T, Error>) -> Void))
    {
        guard let url = URL(string: baseURL+urlParam) else {return}
        let request = URLRequest(url: url)
        AF.request(url, method: .get).responseDecodable(of: T.self) { response in
            print(response)
            if let error = response.error {
                completion(.failure(error))
            } else {
                do {
                    let items = try JSONDecoder().decode(T.self, from: response.data!)
                    completion(.success(items))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    //POST
    func createPostsForAlamofire<T: Codable>(
        type: T.Type,
        urlParam: String = "",
        parametres: [String:Any] = ["":""],
        completion: @escaping (Result<T, Error>) -> Void)
    {
        guard let url = URL(string: baseURL + urlParam) else {return}
        let request = URLRequest(url: url)
        AF.request(
            url,
            method: .post,
            parameters: parametres,
            encoding: JSONEncoding.default).responseDecodable(of: T.self)
        {
            response in
            print(response)
            if let error = response.error {
                completion(.failure(error))
            } else {
                do {
                    let items = try JSONDecoder().decode(T.self, from: response.data!)
                    completion(.success(items))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}



/*
 func getPostItems () {
     guard let url = URL(string: "\(baseURL)/posts") else {return}
     AF.request(url, method: .get).responseDecodable(of: [PostResponseModel].self) { response  in
         print(response)
         switch response.result {
         case .success(let items):
             self.postItems = items
             self.table.reloadData()
         case .failure(let error):
             print(error.localizedDescription)
         }
     }
 }
 */

/*
 func createItems() {
     guard let url = URL(string: "\(baseURL)/posts") else {return}
     
     let params: Parameters = [
         "userId":100,
         "title":"New Post created",
         "body": "bla-bla"]
     
     AF.request(url,
                method: .post,
                parameters: params,
                encoding: JSONEncoding.default).responseDecodable(of: PostResponseModel.self)
     {
         response  in
         print(response)
         switch response.result {
         case .success(let item):
             self.postItems?.insert(item, at: 0)
             self.table.reloadData()
         case .failure(let error):
             print(error.localizedDescription)
         }
     }
 }
 */
