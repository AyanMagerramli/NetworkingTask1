//
//  HomeViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

final class PostViewModel {
    
    var postItems: [PostResponseModel]?
    private let networkManager: NetworkManager
    
    private enum Constant: String {
        case postURL = "posts"
    }
    
    init( networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getPostItems(completion: @escaping (()-> Void)) {
        networkManager.getObjects(
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
}
