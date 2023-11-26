//
//  PhotoDetailViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 27.11.23.
//

import Foundation

final class PhotoDetailViewModel {
    var photos = [PhotoResponseModel]()
    let networkManager: NetworkManager
    var id = 0
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getPhotos (completion: @escaping() -> Void) {
        networkManager.getObjects(
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
