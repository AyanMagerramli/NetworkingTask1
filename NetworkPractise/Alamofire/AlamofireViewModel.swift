//
//  AlamofireViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 30.11.23.
//

import Foundation

final class AlamofireViewModel {
    var postItems: [PostResponseModel]?
    
    private enum Constant: String {
        case postParam = "/posts"
    }
    
    func getObjects(completion: @escaping(() -> Void)) {
        NetworkManager.shared.getObjectsForAlamofire(
            type: [PostResponseModel].self,
            urlParam: Constant.postParam.rawValue)
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
    
    func createObjects(completion: @escaping(() -> Void)) {
        NetworkManager.shared.createPostsForAlamofire(
            type: PostResponseModel.self,
            urlParam: Constant.postParam.rawValue,
            parametres: [
                "userId":100,
                "title":"New Post created",
                "body": "bla-bla"])
        {
            [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let item):
                let item = item
                self?.postItems?.insert(item, at: 0)
                completion()
            }
        }
    }
}
