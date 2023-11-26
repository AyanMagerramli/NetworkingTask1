//
//  CommentResponseModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

typealias Comments = [CommentResponseModel]

struct CommentResponseModel: Codable, CommentCellProtocol {
    
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
    
    var commentName: String {
        name ?? ""
    }
    
    var commentEmail: String {
        email ?? ""
    }
    
    var commentBody: String {
        body ?? ""
    }
}

//[
//  {
//    "postId": 1,
//    "id": 1,
//    "name": "id labore ex et quam laborum",
//    "email": "Eliseo@gardner.biz",
//    "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
//  }
//]
