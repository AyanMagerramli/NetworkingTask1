//
//  AlbumViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation
final class AlbumViewModel {

    let networkManager: NetworkManager
    var albums = [AlbumResponseModel]()
    
    private enum Constant: String {
        case albumParam = "albums"
    }
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getAlbums(completion: @escaping ()-> Void) {
        networkManager.getObjects(
            type: [AlbumResponseModel].self,
            urlParam: Constant.albumParam.rawValue)
        {
            [weak self] result in
            switch result {
            case .success(let items):
                self?.albums = items
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
