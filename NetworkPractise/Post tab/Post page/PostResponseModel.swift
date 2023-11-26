//
//  ResponseModelPOST.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

typealias postItems = [PostResponseModel]

struct PostResponseModel: Codable, PostCellProtocol {
    let userId : Int?
    let id: Int?
    let title: String?
    let body: String?
    
    var postBody: String {
        body ?? ""
    }
    
    var postTitle: String {
        title ?? ""
    }
}

/*
 {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  }
 */
