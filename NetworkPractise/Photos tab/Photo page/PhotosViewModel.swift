//
//  PhotosViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

final class PhotosViewModel {
    var photos = [PhotoResponseModel]()
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    private enum Constant: String {
        case photoParam = "photos"
    }
    
    func getPhotos(completion: @escaping () -> Void) {
        networkManager.getObjects(
            type: [PhotoResponseModel].self,
            urlParam: Constant.photoParam.rawValue)
        {
            [weak self] result in
            switch result {
            case .success(let photos):
                self?.photos = photos
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
