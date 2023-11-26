//
//  SecondViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

final class CommentsViewModel {
    var commentItems = [CommentResponseModel]()
    let networkManager: NetworkManager
    var postId = 0
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getComments(completion: @escaping (()-> Void)) {
        networkManager.getObjects(
            type: [CommentResponseModel].self,
            urlParam: "comments?postId=4")
        {
            [weak self] result in
            switch result {
            case .success(let items):
                self?.commentItems = items
                print("COMMEEENTSS ARE \(self?.commentItems.count)")
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
