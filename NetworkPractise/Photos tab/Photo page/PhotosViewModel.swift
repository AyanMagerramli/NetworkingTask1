//
//  PhotosViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

final class PhotosViewModel {
    var photos = [PhotoResponseModel]()
    
    private enum Constant: String {
        case photoParam = "photos"
    }
    
    func getPhotos(completion: @escaping () -> Void) {
        NetworkManager.shared.getObjects(
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
