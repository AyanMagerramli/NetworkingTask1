//
//  PhotoDetailViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 27.11.23.
//

import Foundation

final class PhotoDetailViewModel {
    var photos = [PhotoResponseModel]()
    var id: Int
    
    init( id: Int) {
        self.id = id
    }
    
    func getPhotos (completion: @escaping() -> Void) {
        NetworkManager.shared.getObjects(
            type: [PhotoResponseModel].self,
            urlParam: "photos?id=\(id)")
        {
            [weak self] result in
            switch result {                
            case .success(let items):
                self?.photos = items
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
