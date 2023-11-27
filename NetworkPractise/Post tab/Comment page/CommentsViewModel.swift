//
//  SecondViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

final class CommentsViewModel {
    var commentItems = [CommentResponseModel]()
    var postId: Int
    
    init(postId: Int) {
        self.postId = postId
    }
    
    func getComments(completion: @escaping (()-> Void)) {
        NetworkManager.shared.getObjects(
            type: [CommentResponseModel].self,
            urlParam: "comments?postId=\(postId)")
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
