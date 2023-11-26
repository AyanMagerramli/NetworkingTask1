//
//  PhotoResponseModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

struct PhotoResponseModel: Codable, PhotoCellProtocol, PhotoDetailCellProtocol {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
    
    var photoView: String {
        url ?? ""
    }
    
    var titleLabel: String {
        title ?? ""
    }
    
    var userPhoto: String {
        url ?? ""
    }    
}

/*
 {
     "albumId": 1,
     "id": 2,
     "title": "reprehenderit est deserunt velit ipsam",
     "url": "https://via.placeholder.com/600/771796",
     "thumbnailUrl": "https://via.placeholder.com/150/771796"
   }
 */
