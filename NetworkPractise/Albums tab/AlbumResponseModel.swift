//
//  AlbumResponseModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation
struct AlbumResponseModel: Codable, AlbumCellProtocol {
    let userId : Int?
    let id: Int?
    let title: String?
    
    var albumName: String {
        title ?? ""
    }
}

/*
 "userId": 1,
 "id": 1,
 "title": "quidem molestiae enim"
}
 */
