//
//  UserViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

final class UserViewModel {
    var users = [WelcomeElement]()
    let networkManager: NetworkManager
    
    init( networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    private enum Constant: String {
        case userParam = "users"
    }
    
    func getUsers(completion: @escaping ()->Void) {
        networkManager.getObjects(
            type: [WelcomeElement].self,
            urlParam: Constant.userParam.rawValue)
        {
            [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
