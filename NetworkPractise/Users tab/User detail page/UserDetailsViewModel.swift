//
//  UserDetailsViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation
final class UserDetailsViewModel {
    let networkManager: NetworkManager
    var userDetails = [WelcomeElement]()
    var userID = 0
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    private enum Constant: String {
        case userParam = "users?id="
    }
    
    func getUserDetails(completion: @escaping ()-> Void) {
        networkManager.getObjects(
            type: [WelcomeElement].self,
            urlParam: Constant.userParam.rawValue + "\(userID)")
        {
            [weak self] result in
            switch result {
            case .success(let users):
                self?.userDetails = users
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
