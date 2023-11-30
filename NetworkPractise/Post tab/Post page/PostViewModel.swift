//
//  HomeViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

final class PostViewModel {
    var postItems: [PostResponseModel]?
    
    private enum Constant: String {
        case postURL = "posts"
    }
    
    func getPostItems(completion: @escaping (()-> Void)) {
        NetworkManager.shared.getObjects(
            type: [PostResponseModel].self,
            urlParam: Constant.postURL.rawValue)
        {
            [weak self] result in
            switch result {
            case .success(let items):
                self?.postItems = items
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func createPosts(completion: @escaping (()-> Void)) {
        let postModel = PostResponseModel(userId: 101, id: 233, title: "My own response model title", body: "My own response model body")
        NetworkManager.shared.createObjects(
            type: PostResponseModel.self,
            urlParam: Constant.postURL.rawValue,
            model: postModel)
        {
            [weak self] result in
            switch result {
            case .success(let item):
                let item = item
                self?.postItems?.append(item)
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
